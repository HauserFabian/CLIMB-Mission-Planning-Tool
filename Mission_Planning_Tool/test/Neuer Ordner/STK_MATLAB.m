% Test for github to check if version changed
TLE_file = 'C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\Mission_Planning_Tool\TLE_PEGASUS_07082023.txt';  % TLE file path\name
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
scenario.SetTimePeriod(Start_Time,End_Time);
scenario.StartTime = Start_Time;
scenario.StopTime = End_Time;
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

disp('App is running') % For progress track after button push
%ConsoleLog("App is running");



%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Button Pushed %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



 
 disp('Creating STK 2')
 %app.ConsoleLog("Creating STK");

         %app.STKApp.visible = true;

%% Updating burns
%  Burn=app.UITable2.Data(:,2);
%  Burn=table2array(Burn);
%  driver = app.CLIMB.Propagator;
%  lastburn = 0;
%   for i = 2:(height(app.UITable2.Data))
%     if Burn(i) == 0 | Burn(1) == 1     % Zeros are deleted Ones are burned
%     burnname = append('Burn' ,num2str(i-1));
%         try
%             driver.MainSequence.Remove(burnname);
%         catch
%          %   break;
%         end
%     end
%     lastburn = i+1;
%   end
%   burnname = append('Burn' ,num2str(lastburn-1));
%         try
%             driver.MainSequence.Remove(burnname);
%         catch
%          %   break;
%         end
% driver.RunMCS;


%% Inputs for attitude
disp ('Reading Schedule')
%app.ConsoleLog("Reading Schedule");

Torque_tool_data  = readtable('C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\Mission_Planning_Tool\test\Torque_tool_data.xlsx');

slew_length= minutes(table2array(Torque_tool_data(19,2)));          % kg*m^2 (Roll)); % Slew length for fixed time
thrust_length_half=minutes(table2array(Torque_tool_data(20,2)));    % half thrust time (before and or after perigee)
thrust_lead_length=minutes(table2array(Torque_tool_data(21,2)));    % additional time in ready to thrust attitude before firing (only before, there is also same time after)

% --Get activity times--
% Access slew and start time
startTimes_slew_c0=transpose(cellstr(accessStartTimes_UTC-slew_length)); % Start time slew to target pointing to GS
startTimes_com=transpose(accessStartTimes);	        % Start time tartget pointing (end slew)
startTimes_slew_c=transpose(accessStopTimes);       % Start time slew to sun pointing (end target pointing)
startTimes_sun_c=transpose(cellstr(accessStopTimes_UTC+slew_length));	 % Start time sun pointing

startTimes_slew_t0=transpose(cellstr(per_pass_time-thrust_length_half-thrust_lead_length-slew_length));    % Start time thrust pointing
startTimes_thrust=transpose(cellstr(per_pass_time-thrust_length_half-thrust_lead_length));  % Stop time thrust pointing
startTimes_slew_t=transpose(cellstr(per_pass_time+thrust_length_half+thrust_lead_length));  % Start time slew to sun pointing
startTimes_sun_t=transpose(cellstr(per_pass_time+thrust_length_half+thrust_lead_length+slew_length));  % Start time sun pointing


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dateUnit = 'UTCG';% 'UTCG' or 'EpSec'
command = strcat(['Units_Set * Connect Date "',dateUnit,'"']);
root.ExecuteCommand(command); % Change connect command date units to desired units:
% startTimes = {};
% Access = app.UITable.Data(:,4);
% Access = table2array(Access);
% StartData= app.UITable.Data(:,1);       % Access start time
% StopData = app.UITable.Data(:,2);       % Access stop time
% StartData = table2array(StartData);     % Access start time table
% StopData = table2array(StopData);       % Access stop time  table
% 
% 
% % Extract selected access times
% for i = 1:(height(app.UITable.Data))
%     if Access(i) == 1
%         startTimes{end+1} = StartData(i);
%         startTimes{end+1} = StopData(i);
%     end
% end

%% Define Attitude Profiles

profileNames = {'Sun_c','Communication','Slew_c','Thrust','Slew_t','Sun_t','Slew_t0','Slew_c0'};
profileTypes = {'AlignConstrain','AlignConstrain','FixedTimeSlew','AlignConstrain','FixedTimeSlew','AlignConstrain','FixedTimeSlew','FixedTimeSlew'};

% for INSTALLED "Aligned and Constrained" attitude profiles:
offsetAngles = {'0'};
% for CUSTOM "Aligned and Constrained" attitude profiles:
alignVectors = {'Sun','Nadir(Centric)','Velocity','Sun'};      % CLIMB axis vectors
alignRefTypes = {'Axis', 'Axis', 'Axis','Axis' }; % Axis  / <x> <y> <z> Euler / <angle 1> <angle 2> <sequence> (12, 21, 31, 32) , ,
alignRefValues = {'1 1 0', '0 1 0', '0 0 -1','1 1 0'};

% Constrained vector data:
constrainVectors = {'Velocity','Velocity','Sun','Velocity'};
constrainRefTypes = {'Axis','Axis','Axis','Axis'};% PR    / <pitch> <roll>
constrainRefValues = {'0 0 -1','0 0 -1','1 1 0','0 0 -1'}; %    RaDec / <raan> <dec>

%   SLEW
% slewtype={'Smooth On'};

alignConstrainIndex = 1;
installedIndex = 1;
slewindex=1;


%% Defining time and length for each attitude profile

% Access=app.UITable.Data(:,4);
% Access = table2array(Access);
% Burn=app.UITable2.Data(:,2);
% Burn=table2array(Burn);

Access = 1+zeros(12,1);
Burn= 1+zeros(54,1);

%{Starttime, Profile Name}
% TimeTable = {Start_Time_period};
% NameTable = {'Sun_t'};
TimeTable = {};
NameTable = {};

% Create two tables for access and thrust maneuver related attitude maneuvers times
% j = 1; 
% Access
for i = 2:(length(Burn)) % extract selected thrust times
    if Burn(i) == 1 && Burn(1) == 0 
        TimeTable{end +1} = startTimes_thrust(i-1); % Stop time thrust pointing
        NameTable{end +1} = profileNames(4);
        TimeTable{end +1} = startTimes_sun_t(i-1); % Start time sun pointing
        NameTable{end +1} = profileNames(6);
        TimeTable{end +1} = startTimes_slew_t(i-1); % Start time slew to sun pointing
        NameTable{end +1} = profileNames(5);
        TimeTable{end +1} = startTimes_slew_t0(i-1); % Start time thrust pointing
        NameTable{end +1} = profileNames(7);
    end
end
disp(NameTable)
for i = 1:(length(Access)) % extract selected access times
    if Access(i) == 1     
        TimeTable{end +1} = startTimes_com(i); % Start time tartget pointing (end slew)
        NameTable{end +1} = profileNames(2);
        TimeTable{end +1} = startTimes_sun_c(i); % Start time sun pointing
        NameTable{end +1} = profileNames(1);
        TimeTable{end +1} = startTimes_slew_c(i); % Start time slew to sun pointing (end target pointing)
        NameTable{end +1} = profileNames(3);
        TimeTable{end +1} = startTimes_slew_c0(i); % Start time slew to target pointing to GS
        NameTable{end +1} = profileNames(8);
    end
end

disp(NameTable)
                    
%% Add Attitude Profiles 
disp('Setting attitude schedule')
%app.ConsoleLog("Setting attitude schedule");

%nProfile = numel(profileNames);
%nProfile = int32(floor(numel(startTimes)/2));
for i = 1:numel(NameTable())

 profileName = string(NameTable{i});
 startTime = TimeTable{i};

 switch profileName
     case "Sun_c"
        profileType = profileTypes{1}; 
        index = 1;
     case "Communication"
        profileType = profileTypes{2}; 
        index = 2;
     case "Slew_c"
        profileType = profileTypes{3}; 
     case "Thrust"
        profileType = profileTypes{4}; 
        index = 3;
     case "Slew_t"
        profileType = profileTypes{5}; 
     case "Sun_t"
        profileType = profileTypes{6}; 
        index = 4;
     case "Slew_t0"
        profileType = profileTypes{7}; 
     case "Slew_c0"
        profileType = profileTypes{8}; 
 end

 

    % Start building command string:
    disp('profileName:')
    disp(profileName)
    disp('startTime:')
    disp(startTime)
    disp('profileType:')
    disp(profileType)


    baseString = string(strjoin(['AddAttitude */Satellite/','CLIMB',' Profile ',profileName,' "',startTime,'" ',profileType],''));
    
    % Gather attitude data based on profile type:
    switch profileType
        
        % Custom "Aligned and Constrained" profile type:
        case 'AlignConstrain'
            
            % Set align/constrain index:
            %index = alignConstrainIndex;

            % Aligned vector data:
              alignVector = alignVectors{index};
             alignRefType = alignRefTypes{index};
            alignRefValue = alignRefValues{index};
              alignString = strcat([alignRefType,' ',alignRefValue,' "',alignVector,'"']);
            
            % Constrained vector data:
              constrainVector = constrainVectors{index};
             constrainRefType = constrainRefTypes{index};
            constrainRefValue = constrainRefValues{index};
              constrainString = strcat([constrainRefType,' ',constrainRefValue,' "',constrainVector,'"']);
            
            % Build profile string:
            profileString = strcat([alignString,' ',constrainString]);
            
            % Increment align/constrain index by 1:
            %alignConstrainIndex = alignConstrainIndex + 1;
        case 'FixedTimeSlew'

            % Set slew index:
            index = slewindex;
            
            % Slew data:
            %slewtype=slewtype{index};
%                 slewString=strcat([slewtype]);
            
            % Build profile string:
            profileString = 'Smooth On'; %slewString;
            
            % Increment inertial index by 1:
            slewindex=slewindex+1;

        % One of the 'installed' "Aligned and Constrained" profiles:
        otherwise
%             
            % Set installed index:
            index = installedIndex;
            
            % Get offset angle:
            offsetAngle = offsetAngles{index};
            offsetString = strcat(['Offset ',offsetAngle]);
            
            % Build profile string:
            profileString = offsetString;
            
            % Increment installed index by 1:
            installedIndex = installedIndex + 1;
    end
    
    
    
   disp('profileString')
   disp(profileString)

    commandString = convertStringsToChars(strjoin([baseString,' ',profileString],''));
    disp('commandString')
    disp(commandString)
    
    root.ExecuteCommand(commandString);% Build command string and execute command:
    %disp(commandString)
end    
    
disp('Running the Scenario')
%app.ConsoleLog("Running Scenario");
%% Checking for Communication-Thrust-Overlaps
%         disp('Checking for Communication-Thrust-Overlaps')
%         app.ConsoleLog("Checking for Communication-Thrust overlaps");
% 
        AttitudeSchedule = CLIMB.DataProviders.Item('Attitude Segment Schedule').Exec(Start_Time,End_Time);
        AttitudeNames = AttitudeSchedule.DataSets.GetDataSetByName('Name').GetValues;
        %disp(AttitudeNames)
        AttitudeNames = transpose(AttitudeNames);

        % standard schedule: {'Thrust'        }
        %                    {'QuatData'      }
        %                    {'Thrust'        }
        %                    {'Slew_t'        }
        %                    {'Sun_t'         }
        %                    {'Slew_c0'       }
        %                    {'Communication' }
        %                    {'Slew_c'        }
        %                    {'Sun_c'         }
        %                    {'Slew_t0'       }


            AttitudeNames = string(AttitudeNames);

        Error = false;
        for i = 1:(numel(AttitudeNames)-1)
                Name1 = AttitudeNames(i);
                Name2 = AttitudeNames(i+1);

            if Name1 == "Thrust" && Name2 ~= "QuatData" && Name2 ~= "Slew_t"
                Error = true;
                disp('Error: Attitude Profile overlap (1)')
                %app.ConsoleLog("Error: Attitude Profile overlap (1)");
                break
            end
            if Name1 == "Slew_t" && Name2 ~= "Sun_t"
                Error = true;
                disp('Error: Attitude Profile overlap (2)')
                %app.ConsoleLog("Error: Attitude Profile overlap (2)");
                break
            end
            if Name1 == "Communication" && Name2 ~= "Slew_c"
                Error = true;
                disp('Error: Attitude Profile overlap (3)')
                %app.ConsoleLog("Error: Attitude Profile overlap (3)");
                break
            end
            if Name1 == "Slew_c" && Name2 ~= "Sun_c"
                Error = true;
                disp('Error: Attitude Profile overlap (4)')
                %app.ConsoleLog("Error: Attitude Profile overlap (4)");
                break
            end
        end

        if Error == false
            disp('No overlaps detected. All profiles Nominal!')
            %app.ConsoleLog("No overlaps detected. All profiles Nominal!");

        else 
            return
        end
% 
% %% Create schedule table output
%         newHeaderNames = {'Access window start', 'Access window end', 'Access duration', 'Access Status'};
%         app.UITable.Data.Properties.VariableNames = newHeaderNames;
%         writetable(app.UITable.Data, 'C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\CLIMB Operation\Access_schedule.csv');
%         newHeaderNames2 = {'Perigee pass time', 'Propulsion On/ Off'};
%         app.UITable2.Data.Properties.VariableNames = newHeaderNames2;
%         writetable(app.UITable2.Data, 'C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\CLIMB Operation\Fire_schedule.csv');
%         newHeaderNames3= {'Scenario start time','Scenario stop time'};
%         app.UITable3.Data.Properties.VariableNames = newHeaderNames3;
%         writetable(app.UITable3.Data, 'C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\CLIMB Operation\Scenario_time.csv');
% 
%% Creating Solar Power Report
        disp('Creating Solar Power report')
        %app.ConsoleLog("Creating Solar Power report");
        
        % Set the Solar Panel Tool
        % https://help.agi.com/stkdevkit/11.4.0/#../Subsystems/connectCmds/Content/cmd_VOSolarPanel.htm?Highlight=Solar%20Panel%20Tool
        stepsize = 600; % Step size 
        root.UnitPreferences.Item('Power').SetCurrentUnit('W'); % default would be dBW

        power_tool_command_addsolarpanels = "VO */Satellite/CLIMB SolarPanel Visualization Radius On 1 AddGroup Solar_Panels";
        power_tool_command_settings = append("VO */Satellite/CLIMB SolarPanel Compute",' "',Start_Time,'" "',End_Time,'" ',string(stepsize));
        %'power_tool_command_settings must look like this: VO */Satellite/CLIMB SolarPanel Compute "6 Aug 2023 20:15:04.320" "9 Aug 2023 20:15:04.320" 600'
        root.ExecuteCommand(power_tool_command_addsolarpanels);
        root.ExecuteCommand(power_tool_command_settings);
        %'VO */Satellite/CLIMB SolarPanel Compute "6 Aug 2023 20:15:04.320" "9 Aug 2023 20:15:04.320" 600'
        %x = append("VO */Satellite/CLIMB SolarPanel Compute",' "',Start_Time,'" "',End_Time,'" ',string(stepsize))
        %Command = convertCharsToStrings('VO */Satellite/CLIMB SolarPanel Compute "') + Start_Time +convertCharsToStrings('" "')+ End_Time + convertCharsToStrings('" ') + string(stepsize);
        
        
        % Get Report
        Solar = CLIMB.DataProviders.Item('Solar Panel Power').Exec(Start_Time,End_Time,stepsize);

        SolarTime = Solar.DataSets.GetDataSetByName('Time').GetValues;
        SolarPower = Solar.DataSets.GetDataSetByName('Power').GetValues;
        SolarIntensity = Solar.DataSets.GetDataSetByName('Solar Intensity').GetValues;

        SolarMatrix = [SolarTime,SolarPower,SolarIntensity];
        SolarTable = array2table(SolarMatrix);
        SolarTable.Properties.VariableNames(1:3) = {'Time (UTCG)','Power (W)','Solar Intensity'};
        %writetable(SolarTable,'C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\Mission_Planning_Tool\test\CLIMB_Solar_Panel_Power.csv');

%% Creating Torque Report
        disp('Creating Torque report')
        %app.ConsoleLog("Creating Torque report");

        Torque=CLIMB.DataProviders.Item('Vectors(Body)').Group.Item('TotalTorque').Exec(Start_Time,End_Time,5);
        TorqueX=Torque.DataSets.GetDataSetByName('x').GetValues;
        TorqueY=Torque.DataSets.GetDataSetByName('y').GetValues;
        TorqueZ=Torque.DataSets.GetDataSetByName('z').GetValues;
        Torque_time=datetime(Torque.DataSets.GetDataSetByName('Time').GetValues, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
        % Torque_time= datestr(Torque_time, 'dd mmm yyyy HH:MM:SS');
        % Torque_time=cellstr(Torque_time);
        % Torque_table = [Torque_time,TorqueX,TorqueY,TorqueZ];
        % Torque_table= array2table(Torque_table);
        % Torque_table.Properties.VariableNames(1:4) = {'Time (UTCG)','Torque in X (Nm)','Torque in Y (Nm)','Torque in Z (Nm)'};
        % writetable(Torque_table,'C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\Mission_Planning_Tool\test\Torque.csv');
% 
%% Creating Angular Momentum Report
        disp('Creating Angular Momentum report')
        %app.ConsoleLog("Creating Angular Momentum report");

        AngMomentum =CLIMB.DataProviders.Item('Vectors(Body)').Group.Item('AngMomentum').Exec(Start_Time,End_Time,5);
        MomentumX=AngMomentum.DataSets.GetDataSetByName('x').GetValues;
        MomentumY=AngMomentum.DataSets.GetDataSetByName('y').GetValues;
        MomentumZ=AngMomentum.DataSets.GetDataSetByName('z').GetValues;
        Momentum_time=datetime(AngMomentum.DataSets.GetDataSetByName('Time').GetValues, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
        % Momentum_time= datestr(Momentum_time, 'dd mmm yyyy HH:MM:SS');
        % Momentum_time=cellstr(Momentum_time);
        % Momentum_table = [Momentum_time,MomentumX,MomentumY,MomentumZ];
        % Momentum_table= array2table(Momentum_table);
        % Momentum_table.Properties.VariableNames(1:4) = {'Time (UTCG)','AngMomentum in X (kg*m^2/sec)','AngMomentum in Y (kg*m^2/sec)', 'AngMomentum in Z (kg*m^2/sec)'};
        % writetable(Momentum_table,'C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\CLIMB Operation\AngularMomentum.csv');
% 
%% Creating angle change and angular velocity report
        disp('Creating angle change and angular velocity report')
        %app.ConsoleLog("Creating angle change and angular velocity report");

        YPR = CLIMB.DataProviders.Item('Attitude YPR').Group.Item('Seq RPY').Exec(Start_Time,End_Time,1);
        Yaw = cell2mat(YPR.DataSets.GetDataSetByName('Yaw').GetValues);
        Pitch = cell2mat(YPR.DataSets.GetDataSetByName('Pitch').GetValues);
        Roll = cell2mat(YPR.DataSets.GetDataSetByName('Roll').GetValues);
        Yaw_rate = cell2mat(YPR.DataSets.GetDataSetByName('Yaw Rate').GetValues);
        Pitch_rate = cell2mat(YPR.DataSets.GetDataSetByName('Pitch Rate').GetValues);
        Roll_rate = cell2mat(YPR.DataSets.GetDataSetByName('Roll Rate').GetValues);
        YPR_time = datetime(YPR.DataSets.GetDataSetByName('Time').GetValues, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
        % YPR_time= datestr(YPR_time, 'dd mmm yyyy HH:MM:SS');
        % YPR_time=cellstr(YPR_time);
        % YPR_table = [YPR_time,Yaw,Pitch,Roll,Yaw_rate,Pitch_rate,Roll_rate];
        % YPR_table= array2table(YPR_table);
        % YPR_table.Properties.VariableNames(1:7) = {'Time (UTCG)','Yaw','Pitch','Roll','Yaw rate','Pitch rate,','Roll rate'};
        % writetable(YPR_table,'C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\CLIMB Operation\YPR.csv');
        
        % No idea for what, completely fucks up format(?)
        % Correction due to -180 to +180 limit
        for i = 1:(length(Yaw)-1)

            while Yaw(i) < (Yaw(i+1)-90)
                Yaw(i+1) = Yaw(i+1)-360;
            end
            while Yaw(i) > (Yaw(i+1)+90)
                Yaw(i+1) = Yaw(i+1)+360;
            end
            while Pitch(i) < (Pitch(i+1)-90)
                Pitch(i+1) = Pitch(i+1)-360;
            end
            while Pitch(i) > (Pitch(i+1)+90)
                Pitch(i+1) = Pitch(i+1)+360;
            end
            while Roll(i) < (Roll(i+1)-90)
                Roll(i+1) = Roll(i+1)-360;
            end
            while Roll(i) > (Roll(i+1)+90)
                Roll(i+1) = Roll(i+1)+360;
            end

        end
        
%% Runninng Torque tool
%         disp('Running Power and torque tool')
%         app.ConsoleLog("Running Power and torque tool");
% 
%         %% Constants
% 
Torque_tool_data  = readtable('C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\Mission_Planning_Tool\test\Torque_tool_data.xlsx');

% CubeSat CAD data
I_xx = table2array(Torque_tool_data(2,2));% kg*m^2 (Roll)
I_yy=table2array(Torque_tool_data(3,2)); % kg*m^2 (Pitch)
I_zz=table2array(Torque_tool_data(4,2)); % kg*m^2 (Yaw)

cm_x=table2array(Torque_tool_data(7,2));%m cm shifts
cm_y=table2array(Torque_tool_data(8,2));%m cm shifts

Height_z=table2array(Torque_tool_data(11,2)); % m

% ADCS data sheet
ADCS_max_L=table2array(Torque_tool_data(2,6)); % mNms
ADCS_max_T=table2array(Torque_tool_data(1,6)); % mNm
RPM_limit=table2array(Torque_tool_data(3,6));% 8000 for CW0017 and 10000 for CW0057for reaction 
I_fw=table2array(Torque_tool_data(5,6)); %kg*m^2 2.4E-05 for CW0017 and 7E-05 for CW0057 and CS has 0.1432 kg*m^2 (need 3.2 E-05)

% ADCS last status from downlink data
RPM_wheel_initial=table2array(Torque_tool_data(15,6));
L_x_cubesat_initial=table2array(Torque_tool_data(16,6));
L_y_cubesat_initial=table2array(Torque_tool_data(17,6));
L_z_cubesat_initial=table2array(Torque_tool_data(18,6));

% Contributors to torque due to CM shift
F=table2array(Torque_tool_data(15,2));% N
t_thrust=table2array(Torque_tool_data(16,2));% s


% Contributors to torque due to thrust vector misallignment 
Misalignment_angle=table2array(Torque_tool_data(17,2)); % deg

% 
% 
% %
% % T_cm_x=cm_x*F; % Torque, Nm
% % T_cm_y=cm_y*F; % Torque, Nm
% % L_cm_x=T_cm_x*t_thrust;
% % L_cm_y=T_cm_x*t_thrust;
% 
%% Input reading

% YPR 
    % Angular_velo_data=readtable("C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\CLIMB Operation\YPR.csv",'HeaderLines', 1);
    % Velo_time=Angular_velo_data(:,1);
    % Velo_time=table2cell(Velo_time);
    % Velo_time=datetime(Velo_time, 'InputFormat', 'd MMM yyyy HH:mm:ss');
    % Yaw=table2array(Angular_velo_data(:,2));
    % Pitch=table2array(Angular_velo_data(:,3));
    % Roll=table2array(Angular_velo_data(:,4));
    % Yaw_rate=table2array(Angular_velo_data(:,5));
    % Pitch_rate=table2array(Angular_velo_data(:,6));
    % Roll_rate=table2array(Angular_velo_data(:,7));

    % Yaw=cell2mat(Yaw);
    % Pitch=cell2mat(Pitch);
    % Roll=cell2mat(Roll);
    % Yaw_rate=cell2mat(Yaw_rate);
    % Pitch_rate=cell2mat(Pitch_rate);
    % Roll_rate=cell2mat(Roll_rate);


        % % Correction due to -180 to +180 limit
        % for i = 1:(length(Yaw)-1)
        % 
        %     while Yaw(i) < (Yaw(i+1)-90)
        %         Yaw(i+1) = Yaw(i+1)-360;
        %     end
        %     while Yaw(i) > (Yaw(i+1)+90)
        %         Yaw(i+1) = Yaw(i+1)+360;
        %     end
        %     while Pitch(i) < (Pitch(i+1)-90)
        %         Pitch(i+1) = Pitch(i+1)-360;
        %     end
        %     while Pitch(i) > (Pitch(i+1)+90)
        %         Pitch(i+1) = Pitch(i+1)+360;
        %     end
        %     while Roll(i) < (Roll(i+1)-90)
        %         Roll(i+1) = Roll(i+1)-360;
        %     end
        %     while Roll(i) > (Roll(i+1)+90)
        %         Roll(i+1) = Roll(i+1)+360;
        %     end
        % 
        % end
% 
% Fire schedule
    Fire_data=readtable("C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\Mission_Planning_Tool\test\Fire_schedule.csv",'HeaderLines', 1);
    Fire_times = table2array(Fire_data(:,1));
    Fire_status = table2array(Fire_data(:,2));
    Burn_time_status = zeros(size(YPR_time,1)-1,1); %  delta_L_x=zeros(size(L_x, 1), 1);

        for i = 1:size(Fire_times)
            if Fire_status(1) == 1
                break
            end
            for j = 1:size(Burn_time_status)
                if abs(seconds(YPR_time(j) - Fire_times(i))) < 300 && Fire_status(i) == 1
                    Burn_time_status(j) = 1;
                end

            end

        end
% 
%% Torque
    Torque_data= readtable("C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\CLIMB Operation\Torque.csv", 'HeaderLines', 1);
    Torque_time=Torque_data(:,1);
    Torque_time = table2cell(Torque_time);
    Torque_time= datetime(Torque_time, 'InputFormat', 'd MMM yyyy HH:mm:ss');
    T_x=1000*table2array(Torque_data(:,2)); % mNm
    T_y=1000*table2array(Torque_data(:,3)); % mNm
    T_z=1000*table2array(Torque_data(:,4)); % mNm

    T=sqrt(T_x.^2+T_y.^2+T_z.^2); % Abs. Torque

    Max_Torque=max(T);% Max. Torque
    disp(['Maximum Instantenious Torque (mNm): ', num2str(Max_Torque)]);

    cum_T_x=sum(T_x);
    cum_T_y=sum(T_y);
    cum_T_z=sum(T_z);
    Total_torque=sqrt(cum_T_x^2+cum_T_y^2+cum_T_z^2);% Abs. Cum. Torque
    disp(['Total Torque (mNm): ', num2str(Max_Torque)]);

% Angular Momentum
    L_data= readtable("C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\CLIMB Operation\AngularMomentum.csv", 'HeaderLines', 1);
    L_time=L_data(:,1);
    L_time = table2cell(L_time);
    L_time= datetime(L_time, 'InputFormat', 'd MMM yyyy HH:mm:ss');
    L_x=1000*table2array(L_data(:,2)); % 1000*kg*m^2/sec= mNms % + L_cm_x*      
    L_y=1000*table2array(L_data(:,3)); % 1000*kg*m^2/sec= mNms
    L_z=1000*table2array(L_data(:,4)); % 1000*kg*m^2/sec= mNms
    L=sqrt(L_x.^2+L_y.^2+L_z.^2);
    Max_L=max(L);
    disp(['Maximum instantaneous Angular Momentum (mNms) ', num2str(Max_L)]);

    delta_L_x=zeros(size(L_x, 1), 1);
    for i = 2:length(delta_L_x)
        delta_L_x_i = L_x(i);
        delta_L_x_iminus1 = L_x(i-1);
        delta_L_x(i) = L_x(i)-L_x(i-1);
    end
    L_x(1)=L_x_cubesat_initial+L_x(1);
    Cum_L_x=L_x(1)+cumsum(delta_L_x);


    delta_L_y=zeros(size(L_y, 1), 1);
    for i = 2:length(delta_L_y)
        delta_L_y_i = L_y(i);
        delta_L_y_iminus1 = L_y(i-1);
        delta_L_y(i) = L_y(i)-L_y(i-1);
    end
    L_y(1)=L_y_cubesat_initial+L_y(1);
    Cum_L_y=L(1)+cumsum(delta_L_y);

    delta_L_z=zeros(size(L_z, 1), 1);
    for i = 2:length(delta_L_z)
        delta_L_z_i = L_z(i);
        delta_L_z_iminus1 = L_z(i-1);
        delta_L_z(i) = L_z(i)-L_z(i-1);
    end
    L_z(1)=L_z_cubesat_initial+L_z(1);
    Cum_L_z=L(1)+cumsum(delta_L_z);

    L_limit_pos=ADCS_max_L*ones(size(L_time));
    L_limit_neg=-ADCS_max_L*ones(size(L_time));

%     time_L_limit_x =max( L_time(abs(Cum_L_x) <= L_limit_pos));
%     time_L_limit_y =max( L_time(abs(Cum_L_y) <= L_limit_pos));
%     time_L_limit_z =max( L_time(abs(Cum_L_z) <= L_limit_pos));

%%  Angular velcoity derivation
    time_step = seconds(Velo_time(2) - Velo_time(1)); % Calculate the time step in seconds

    Yaw_rate = diff(Yaw(:))./time_step; % deg/s
    Pitch_rate = diff(Pitch(:))./time_step;
    Roll_rate = diff(Roll(:))./time_step;

%% Angular momentum due to CM shift
    Angular_momentum_pitch_thrust_persecond = F*cm_x; % Nm
    Angular_momentum_roll_thrust_persecond = F*cm_y; % Nm
    Thrust_momentum_pitch = Angular_momentum_pitch_thrust_persecond*time_step*Burn_time_status; 
    Thrust_momentum_roll = Angular_momentum_roll_thrust_persecond*time_step*Burn_time_status;
    Thrust_momentum_pitch = cumtrapz(Thrust_momentum_pitch);
    Thrust_momentum_roll = cumtrapz(Thrust_momentum_roll);

 %% Angular mometum due to Thrust vector misallignment 
    Thrust_momentum_PR=F*Height_z*sind(5); % Either could be added to X or Y, roll or pitch, Nm
    Angular_momentum_misall_PR=cumtrapz(Thrust_momentum_PR*time_step*Burn_time_status);

 %% Total angular momentum   
    Angular_momentum_yaw_STK = (Yaw_rate*pi/180) * I_zz; % Nms
    Angular_momentum_pitch_STK = (Pitch_rate*pi/180) * I_yy;
    Angular_momentum_roll_STK = (Roll_rate*pi/180) * I_xx;

    Angular_momentum_yaw = Angular_momentum_yaw_STK ; % Nms
    Angular_momentum_pitch= Angular_momentum_pitch_STK + Thrust_momentum_pitch+Angular_momentum_misall_PR; 
    Angular_momentum_roll= Angular_momentum_roll_STK +Thrust_momentum_roll;
%     figure Name STK_L
%         hold on
%         plot(Velo_time(1:length(Yaw_rate)),Angular_momentum_yaw_STK,  'Color', 'green')
%         plot(Velo_time(1:length(Yaw_rate)),Angular_momentum_pitch_STK, 'Color', 'black')
%         plot(Velo_time(1:length(Yaw_rate)),Angular_momentum_roll_STK,  'Color', 'red')
%         xlabel('Time') 
%         ylabel('Angular momentum (Nms)')
%         legend({'Angular momentum in yaw','Angular momentum in pitch','Angular momentum in roll', ...
%             },'Location','southeast')
%         hold off
% 
% 
%      figure Name VectorMis_L
%             hold on
%             plot(Velo_time(1:length(Yaw_rate)),Angular_momentum_misall_PR, 'Color', 'black')
%             
%             xlabel('Time') 
%             ylabel('Angular momentum (Nms)')
%             legend({'Angular momentum due to thrust vector misalignment', ...
%                 },'Location','southeast')
%             hold off
% 
%       figure Name Total_L
%             hold on
%             plot(Velo_time(1:length(Yaw_rate)),Angular_momentum_yaw,  'Color', 'green')
%             plot(Velo_time(1:length(Yaw_rate)),Angular_momentum_pitch, 'Color', 'black')
%             plot(Velo_time(1:length(Yaw_rate)),Angular_momentum_roll,  'Color', 'red')
%             xlabel('Time') 
%             ylabel('Angular momentum (Nms)')
%             legend({'Angular momentum in yaw','Angular momentum in pitch','Angular momentum in roll', ...
%                 },'Location','southeast')
%             hold off

%% RPM of the wheel
    RPM_x = Angular_momentum_roll/I_fw*30/pi+RPM_wheel_initial; 
    RPM_y = Angular_momentum_pitch/I_fw*30/pi+RPM_wheel_initial;
    RPM_z = Angular_momentum_yaw/I_fw*30/pi+RPM_wheel_initial;

    figure Name RPM
        hold on
        plot(Velo_time(1:length(Yaw_rate)),RPM_x, 'Color', 'red','LineWidth',2)
        plot(Velo_time(1:length(Yaw_rate)),RPM_y, 'Color', 'black', 'LineWidth',2)
        plot(Velo_time(1:length(Yaw_rate)),RPM_z,'Color', 'green','LineWidth',2)

        yline(RPM_limit, '--', 'LineWidth',2, 'Color', 'red')
        yline(-RPM_limit, '--', 'LineWidth',2, 'Color', 'red')
        ylim([-8000 8000])
        xlabel('Time','FontSize',24,'FontWeight','bold') 
        ylabel('RPMs','FontSize',24,'FontWeight','bold') 
        legend({'RPM around x','RPM around y','RPM around z', ...
            'Upper Limit' ,'Lower Limit'},'Location','southeast','FontSize',24,'FontWeight','bold')
        set(gca,'FontSize', 24)
        hold off 
% 
%     Velo_time=cellstr(Velo_time(1:size(RPM_x)));
%     RPM_over_time=[Velo_time,num2cell(RPM_x),num2cell(RPM_y),num2cell(RPM_z)];
%     RPM_over_time=array2table(RPM_over_time);
%     RPM_over_time.Properties.VariableNames(1:4) = {'Time (UTCG)','RPM in X','RPM in Y','RPM in Z'};
%     writetable(RPM_over_time,'C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\CLIMB Operation\RPM_overTime.csv');
%     disp('RPM report is generated')
%     app.ConsoleLog("RPM report is generated");
% 
% %% Runninng Power tool
% pyrunfile('C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\CLIMB Operation\PowerTool.py')
% 
% disp('Power tool report is generated')
% app.ConsoleLog("Power tool report is genrated");
% 
% disp('Completed')
% app.ConsoleLog("Completed");
% 






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