TLE_file = 'C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\CLIMB Operation\TLE_PEGASUS_07082023.txt';  % TLE file path\name
[Orbit_data_array,epoch_tle,End_Time] = TLE_processing_fcn(TLE_file); % function that extracts orbital elements from TLEs

%Time

Start_Time=epoch_tle;

% For display and attitude input only
Start_Time_period=datetime(epoch_tle, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
Start_Time_period=cellstr(Start_Time_period);
Stop_Time_period=datetime(End_Time, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
Stop_Time_period=cellstr(Stop_Time_period);

scenario_period = table(Start_Time_period, Stop_Time_period);
% UITable3.Data=scenario_period;

%% Connect to STK
% Get reference to running STK instance
uiApplication = actxGetRunningServer('STK12.application');

% Get our IAgStkObjectRoot interface
root = uiApplication.Personality2;

% if isempty(STKApp) || ~iscom(STKApp)
%         STKApp = actxserver('STK12.Application');
%         %STKvisible = false;
% end
% 
%     root = STKPersonality2;
    
%% Open Scenario
disp('Opening STK Scenario')
%ConsoleLog("Opening STK Scenario");

scenario_file = 'C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\CLIMB Operation\CLIMB_scenario1\CLIMB_scenario1.sc';

%root.LoadScenario(scenario_file)
disp('Before root.CurrentScenario')
scenario = root.CurrentScenario;
disp('OAfter root.CurrentScenario')
%scenario.SetTimePeriod(Start_Time,End_Time);
%scenario.StartTime = Start_Time;
%scenario.StopTime = End_Time;
root.ExecuteCommand('Animate * Reset');

%% Open Objects
disp('Opening Objects')
%ConsoleLog("Opening Objects");

CLIMB = scenario.Children.Item('CLIMB');       % Open Satellite
FHWN = scenario.Children.Item('FHWN');       % Open Satellite
Sensor=FHWN.Children.Item('Sensor');

%% Set initial state
disp('Setting Initial State')
%ConsoleLog("Setting Initial State");

% Initial State parameters
ra = Orbit_data_array(:,4);
rp = Orbit_data_array(:,5);
ecc = Orbit_data_array(:,2);
Incl = Orbit_data_array(:,3);
RAAN = Orbit_data_array(:,6);
ArgPeri = Orbit_data_array(:,7);
MeanAno = Orbit_data_array(:,11);

% Initial State definition
driver = CLIMB.Propagator;
initState = driver.MainSequence.GetItemByName('Initial State');
initState.OrbitEpoch = Start_Time;

% Elements:
initState.SetElementType('eVAElementTypeKeplerian');
kep = initState.Element;
kep.ApoapsisAltitudeSize = ra;
kep.Eccentricity = ecc;
kep.Inclination = Incl;
kep.RAAN = RAAN;
kep.ArgOfPeriapsis = ArgPeri;
kep.MeanAnomaly = MeanAno;

% Run the Astrogator
driver.RunMCS;
%% Access report
disp('Getting access windows')
% ConsoleLog("Getting access windows");

access =CLIMB.GetAccessToObject(Sensor);
access.ComputeAccess;
accessDP = access.DataProviders.Item('Access Data').Exec(scenario.StartTime,scenario.StopTime);
accessStartTimes_UTC=datetime(accessDP.DataSets.GetDataSetByName('Start Time').GetValues, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
accessStartTimes = datestr(accessStartTimes_UTC, 'dd mmm yyyy HH:MM:SS');
accessStartTimes=cellstr(accessStartTimes);
accessStopTimes_UTC=datetime(accessDP.DataSets.GetDataSetByName('Stop Time').GetValues, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
accessStopTimes= datestr(accessStopTimes_UTC, 'dd mmm yyyy HH:MM:SS');
accessStopTimes=cellstr(accessStopTimes);
root.UnitPreferences.Item('Time').SetCurrentUnit('Min');
accessDuration = accessDP.DataSets.GetDataSetByName('Duration').GetValues;

% linktable=[accessStartTimes accessStopTimes accessDuration]; 
% linktable=cell2table(linktable);
% checkboxColumn1 = false(height(linktable), 1); % Add this new column to the existing table
% linktable= [linktable, array2table(checkboxColumn1)];
% UITable.Data = linktable;% Update the UITable with the new data

%% Perigee passes report
disp('Getting pergiee passes')
% ConsoleLog("Getting perigee passes");

passes_res = CLIMB.DataProviders.Item('Passes').Exec(Start_Time,End_Time);
per_pass_time=datetime(passes_res.DataSets.GetDataSetByName('Time of Perigee').GetValues, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
per_pass_cell = cellstr(per_pass_time);
per_pass_table = table(per_pass_cell);

% checkboxColumn2=true(height(per_pass_table), 1);
% per_pass_table=[per_pass_table,array2table(checkboxColumn2)];
% per_pass_table = [{'Remove all burns (Override)', false};per_pass_table];
% per_pass_table(height(per_pass_table),:) = [];
% UITable2.Data=per_pass_table;

thrust_start = per_pass_time-minutes(5);
thrust_stop = per_pass_time+minutes(5);

disp('App is running') % For progress track after button push
%ConsoleLog("App is running");

%% Attitude




% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
% ------------------------------Attitude-----------------------------------
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------

%% Create Attiude time schedule
thrust_start = per_pass_time-minutes(5);
thrust_stop = per_pass_time+minutes(5);
thrust_start(end) = []; % Thruster maneuver start dates
thrust_stop(end) = []; % Thruster maneuver start dates
accessStartTimes_UTC;  % Access start dates

leadtime = minutes(5);
trailtime = minutes(5);
slew_duration = minutes(5);


% Thrust and access pointing start and stop dates
start_date_thrustpointing = thrust_start-leadtime;
stop_date_thrustpointing = thrust_stop+trailtime;
start_date_targetpointing = accessStartTimes_UTC-leadtime;
stop_date_targetpointing = accessStopTimes_UTC-trailtime;

% Start date sun pointing. Sun point start date = [At beginning of scenario; after thrust + slew duration; after acess + slew duration]
start_date_sunpointing = [stop_date_thrustpointing+slew_duration;... % Initial attitude of stk scenario is already sun pointing therefore no need to define here
                          stop_date_targetpointing+slew_duration];

% Start date for slew maneuvers. Slew start date = [before thrust; after thrust; before access; after access]
start_date_slew = [start_date_thrustpointing-slew_duration;...
                   stop_date_thrustpointing;...
                   start_date_targetpointing-slew_duration;...
                   stop_date_targetpointing];

%%
% Creating Attitude commands to STK
sunpointing_command = 'AddAttitude */Satellite/CLIMB Profile SunPointing "06-Aug-2023 21:06:18" AlignConstrain Axis 1 1 0 "Sun" Axis 0 0 -1 "Velocity"';
thrustpointing_command = 'AddAttitude */Satellite/CLIMB Profile ThrustPointing "06-Aug-2023 21:06:18" AlignConstrain Axis 0 0 -1 "Velocity" Axis 1 1 0 "Sun"';
targetpointing_command = 'AddAttitude */Satellite/CLIMB Profile TargetPointing "06-Aug-2023 21:06:18" AlignConstrain Axis 0 1 0 "FHWN" Axis 0 0 -1 "Velocity"';
slew_command = 'AddAttitude */Satellite/CLIMB Profile Slew "06-Aug-2023 21:06:18" FixedTimeSlew Smooth On';

% Get position of " sign in command string for replacing the "date" in the string
date_string_all = [find(thrustpointing_command=='"');find(targetpointing_command=='"');find(sunpointing_command=='"');find(slew_command=='"') 0 0 0 0];

%
thrustpointing_command = repmat(thrustpointing_command, length(start_date_thrustpointing), 1);
thrustpointing_command(:,date_string_all(1,1)+1:date_string_all(1,2)-1) = char(start_date_thrustpointing);

targetpointing_command = repmat(targetpointing_command, length(start_date_targetpointing), 1);
targetpointing_command(:,date_string_all(2,1)+1:date_string_all(2,2)-1) = char(start_date_targetpointing);

sunpointing_command = repmat(sunpointing_command, length(start_date_sunpointing), 1);
sunpointing_command(:,date_string_all(3,1)+1:date_string_all(3,2)-1) = char(start_date_sunpointing);

slew_command = repmat(slew_command, length(start_date_slew), 1);
slew_command(:,date_string_all(4,1)+1:date_string_all(4,2)-1) = char(start_date_slew);

for i=1:height(thrustpointing_command)
    root.ExecuteCommand(thrustpointing_command(i,:));
end
for i=1:height(targetpointing_command)
    root.ExecuteCommand(targetpointing_command(i,:));
end
for i=1:height(sunpointing_command)
    root.ExecuteCommand(sunpointing_command(i,:));
end
for i=1:height(slew_command)
    root.ExecuteCommand(slew_command(i,:));
end


root.ExecuteCommand('SetAttitude */Satellite/CLIMB ClearData')


%% TLE Function
% TLE processing function (https://de.mathworks.com/matlabcentral/fileexchange/39364-two-line-element)
function [OE_array,Epoch_vect,End_Time,epoch_jul] = TLE_processing_fcn(fname)

    
    fid = fopen(fname, 'r');        % Open the TLE file for reading
    OE_array = [];                  % Initialize an empty array to store orbital elements
    Epoch_vect = [];
    mu = 398600; % Standard gravitational parameter for the earth
    
    % Read and process TLE sets from the file
    while ~feof(fid)
    % while fopen(fid)

        % Read two lines from the file
        L1c = fgets(fid);
        L2c = fgets(fid);
        
        % Display the two lines
        %fprintf(L1c);
        %fprintf(L2c);
        
        % Extract relevant data from the lines
        %L1 = sscanf(L1c,'%d%6d%*c%9d%*c%*2f%f%f%5d%*c%*d%5d%*c%*d%d%5d',[1,9])  % deletes first two digits (year) of epoch

        L1 = sscanf(L1c,'%d%6d%*c%9d%*c%f%f%5d%*c%*d%5d%*c%*d%d%5d%*2f',[1,9]);   % keeps first two digits (year) of epoch
        L2 = sscanf(L2c,'%d%6d%f%f%f%f%f%f%f',[1,8]);
        
        % Epoch
        epoch_jul = L1(1,4);   % Epoch Date and Julian Date Fraction
        
        % Apparently there is no direct way in matlab to convert tle epoch
        % in date, therefore the apporach below is used (there is for sure a simpler way)
        epoch_str =  num2str(epoch_jul);                            % convert tle to str
        year = str2num(epoch_str(1:2))+2000;                        % extract number of year (first 2 digits)
        epoch_dayfract = str2num(epoch_str(3:end));                % exctract the other digits (day fraction)
        date_0 = append('1 Jan ',num2str(year),' 00:00:00.000');    % combine it and convert to date
        epoch = char(datetime(date_0,'Format','d MMM uuuu HH:mm:ss.SSS') + days(epoch_dayfract-1)); % actual date of TLE

        
        epoch_dayfract = epoch_dayfract + 3;
        if epoch_dayfract > 365
            epoch_dayfract = epoch_dayfract - 365;
            year = year + 1;
        end

        date_0 = append('1 Jan ',num2str(year),' 00:00:00.000');    % combine it and convert to date
        End_Time = char(datetime(date_0,'Format','d MMM uuuu HH:mm:ss.SSS') + days(epoch_dayfract-1)); 
        

        % Orbital elements
        Db = L1(1,5);          % Ballistic Coefficient
        inc = L2(1,3);         % Inclination [deg]
        RAAN = L2(1,4);        % Right Ascension of the Ascending Node [deg]
        e = L2(1,5)/1e7;       % Eccentricity
        w = L2(1,6);           % Argument of periapsis [deg]
        M = L2(1,7);           % Mean anomaly [deg]
        n = L2(1,8);           % Mean motion [Revs per day]

        a = (mu/(n*2*pi/(24*3600))^2)^(1/3);  % Semi-major axis [km]
        ra = a*(e+1)-6378;      % Apogee
        rp = a*(1-e)-6378;      % Perigee
    
        % Calculate the eccentric anomaly using Mean anomaly
        err = 1e-10;  % Calculation Error
        M_rad = M*pi/180;
        E0 = M;
        t = 1;
        itt = 0;
        while (t)
            E = M + e*sind(E0);     % Eccentrcic anomaly
            if (abs(E-E0) < err)
                t = 0;
            end
            E0 = E;
            itt = itt + 1;
        end
        
        % get true anoamly
        theta = acosd((cosd(E)-e)/(1-e*cosd(E)));   % Not 100% sure this is correct

        % Six orbital elements
        OE = [a e inc ra rp RAAN w E n Db M];
        OE_array = [OE_array; OE];                  % Append OE to the array
        Epoch_vect = [Epoch_vect; epoch];
       
    end
    
    % Close the file
    fclose(fid);
end