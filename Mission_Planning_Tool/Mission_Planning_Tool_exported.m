classdef Mission_Planning_Tool_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        CLIMBPredictorUIFigure          matlab.ui.Figure
        PowertoolMenu                   matlab.ui.container.Menu
        PowermodesMenu                  matlab.ui.container.Menu
        PowerconsumptiondataMenu        matlab.ui.container.Menu
        BatterymodeldataMenu            matlab.ui.container.Menu
        TorquetoolMenu                  matlab.ui.container.Menu
        TorquetooldataMenu              matlab.ui.container.Menu
        Menu                            matlab.ui.container.Menu
        TabGroup                        matlab.ui.container.TabGroup
        SchedulerTab                    matlab.ui.container.Tab
        TabGroup2                       matlab.ui.container.TabGroup
        InitialStateTab                 matlab.ui.container.Tab
        Label                           matlab.ui.control.Label
        ShowcurrentTLEButton            matlab.ui.control.Button
        NORADIDEditField                matlab.ui.control.NumericEditField
        NORADIDLabel                    matlab.ui.control.Label
        PerigeePassesLabel              matlab.ui.control.Label
        AccessDataLabel                 matlab.ui.control.Label
        ConsoleLogTextArea              matlab.ui.control.TextArea
        ConsoleLogTextAreaLabel         matlab.ui.control.Label
        PerigeePassDateTableInfo        matlab.ui.control.Table
        AccessTableInfo_1               matlab.ui.control.Table
        ScenarioStopTimeEditField       matlab.ui.control.EditField
        ScenarioStopTimeEditFieldLabel  matlab.ui.control.Label
        ScenarioStartTimeEditField      matlab.ui.control.EditField
        ScenarioStartTimeEditFieldLabel  matlab.ui.control.Label
        PropagateButton                 matlab.ui.control.Button
        LoadmostrecentTLEButton         matlab.ui.control.Button
        TLEInfoTable                    matlab.ui.control.Table
        ManeuverSelectionTab            matlab.ui.container.Tab
        ThrusterEfficiencyEditField     matlab.ui.control.NumericEditField
        ThrusterEfficiencyEditFieldLabel  matlab.ui.control.Label
        ActivityNameEditFieldLabel_5    matlab.ui.control.Label
        ActivityNameEditFieldLabel_4    matlab.ui.control.Label
        ThrustNEditField                matlab.ui.control.NumericEditField
        ThrustNEditFieldLabel           matlab.ui.control.Label
        IspsEditField                   matlab.ui.control.NumericEditField
        IspsEditFieldLabel              matlab.ui.control.Label
        ManeuverDurationinminEditField  matlab.ui.control.NumericEditField
        ManeuverDurationinminEditFieldLabel  matlab.ui.control.Label
        ManOutputGlobalTable            matlab.ui.control.Table
        ManeuverOutputTable             matlab.ui.control.Table
        PropagateManeuversButton        matlab.ui.control.Button
        ManeuverInputTable              matlab.ui.control.Table
        AcitvitySchedulerTab            matlab.ui.container.Tab
        PerigeePassDateTableInfo_2      matlab.ui.control.Table
        ActivityNameEditFieldLabel_3    matlab.ui.control.Label
        ActivityNameEditFieldLabel_2    matlab.ui.control.Label
        PowerWEditField                 matlab.ui.control.NumericEditField
        PowerWEditFieldLabel            matlab.ui.control.Label
        ActivityStopTimeEditField       matlab.ui.control.EditField
        ActivityStopTimeEditFieldLabel  matlab.ui.control.Label
        ActivityStartTimeEditField      matlab.ui.control.EditField
        ActivityStartTimeEditFieldLabel  matlab.ui.control.Label
        ActivityNameEditField           matlab.ui.control.EditField
        ActivityNameEditFieldLabel      matlab.ui.control.Label
        AddActivityButton               matlab.ui.control.Button
        ActivityOutputTable             matlab.ui.control.Table
        AccessTableInfo_2               matlab.ui.control.Table
        AttitudeProfileTab              matlab.ui.container.Tab
        SlewLabel                       matlab.ui.control.Label
        ThrustPointingLabel             matlab.ui.control.Label
        TargetPointingLabel             matlab.ui.control.Label
        DurationminutesEditField        matlab.ui.control.NumericEditField
        AttitudeGlobalOutputTable       matlab.ui.control.Table
        ClearAttitudeButton             matlab.ui.control.Button
        AttitudeOutputTable             matlab.ui.control.Table
        AddAttitudeProfileButton        matlab.ui.control.Button
        DurationminutesEditFieldLabel   matlab.ui.control.Label
        TrailTimeminutesEditField_2     matlab.ui.control.NumericEditField
        TrailTimeminutesEditField_2Label  matlab.ui.control.Label
        LeadTimeminutesEditField_2      matlab.ui.control.NumericEditField
        LeadTimeminutesEditField_2Label  matlab.ui.control.Label
        TrailTimeminutesEditField       matlab.ui.control.NumericEditField
        TrailTimeminutesEditFieldLabel  matlab.ui.control.Label
        LeadTimeminutesEditField        matlab.ui.control.NumericEditField
        LeadTimeminutesEditFieldLabel   matlab.ui.control.Label
        SequenceofEventsTab             matlab.ui.container.Tab
        ConflictOutputTable             matlab.ui.control.Table
        ConflictCheckButton             matlab.ui.control.Button
        CreateActivityScheduleButton    matlab.ui.control.Button
        SoETable                        matlab.ui.control.Table
        ConstraintAnalysisTab_2         matlab.ui.container.Tab
        zEditField                      matlab.ui.control.NumericEditField
        zEditFieldLabel                 matlab.ui.control.Label
        yEditField                      matlab.ui.control.NumericEditField
        yEditFieldLabel                 matlab.ui.control.Label
        xEditField                      matlab.ui.control.NumericEditField
        xLabel                          matlab.ui.control.Label
        InitialBatteryCapacityEditField  matlab.ui.control.NumericEditField
        InitialBatteryCapacityEditFieldLabel  matlab.ui.control.Label
        InitialAngularMomentumfromADCSinNmsLabel  matlab.ui.control.Label
        ADCSConstraintAnalysisButton    matlab.ui.control.Button
        PowerConstraintAnalysisButton   matlab.ui.control.Button
        ConstraintTextArea              matlab.ui.control.TextArea
        SchedulePlot_14                 matlab.ui.control.UIAxes
        SchedulePlot_13                 matlab.ui.control.UIAxes
        PlotScheduleButton              matlab.ui.control.Button
        SchedulePlot_2                  matlab.ui.control.UIAxes
        ConstraintAnalysisTab           matlab.ui.container.Tab
        TabGroup4                       matlab.ui.container.TabGroup
        PowerTab_2                      matlab.ui.container.Tab
        SchedulePlot_7                  matlab.ui.control.UIAxes
        SchedulePlot_6                  matlab.ui.control.UIAxes
        SchedulePlot_5                  matlab.ui.control.UIAxes
        SchedulePlot_4                  matlab.ui.control.UIAxes
        SchedulePlot_3                  matlab.ui.control.UIAxes
        ADCSTab_2                       matlab.ui.container.Tab
        SchedulePlot_10                 matlab.ui.control.UIAxes
        SchedulePlot_9                  matlab.ui.control.UIAxes
        SchedulePlot_12                 matlab.ui.control.UIAxes
        SchedulePlot_8                  matlab.ui.control.UIAxes
        SchedulePlot_11                 matlab.ui.control.UIAxes
        LongTermPropulsoinToolTab       matlab.ui.container.Tab
        ManeuverSettingsLabel           matlab.ui.control.Label
        ClearAstrogatorButton           matlab.ui.control.Button
        ManueverGlobalLongTermTable     matlab.ui.control.Table
        SkipeveryxmaneuverEditField     matlab.ui.control.NumericEditField
        SkipeveryxmaneuverEditFieldLabel  matlab.ui.control.Label
        StoppingConditionLabel          matlab.ui.control.Label
        LongTermPropagateButton         matlab.ui.control.Button
        StartTimeEditField              matlab.ui.control.EditField
        StartTimeEditFieldLabel         matlab.ui.control.Label
        StopTimeEditField               matlab.ui.control.EditField
        StopTimeEditFieldLabel          matlab.ui.control.Label
        ThrusterEfficiencyEditField_2   matlab.ui.control.NumericEditField
        ThrusterEfficiencyEditField_2Label  matlab.ui.control.Label
        ThrustNEditField_2              matlab.ui.control.NumericEditField
        ThrustNEditField_2Label         matlab.ui.control.Label
        IspsEditField_2                 matlab.ui.control.NumericEditField
        IspsEditField_2Label            matlab.ui.control.Label
        ManeuverDurationinminEditField_2  matlab.ui.control.NumericEditField
        ManeuverDurationinminEditField_2Label  matlab.ui.control.Label
        MaxIterationsEditField          matlab.ui.control.NumericEditField
        MaxIterationsEditFieldLabel     matlab.ui.control.Label
        ApogeeAltitudekmEditField       matlab.ui.control.NumericEditField
        ApogeeAltitudekmEditFieldLabel  matlab.ui.control.Label
        AltitudePlotLongTerm            matlab.ui.control.UIAxes
    end


    properties (Access = public) % To keep STK open after button release
       % Global Variables that can be used everywhere within the code with app.variable
       % First Propagation without manuevers, 2nd with maneuvers

       % General
       STKApp
       CLIMB            % Climb satellite object from STK
       CLIMB_longterm
       root
       TLE_Epoch        % TLE Epoch
       Orbit_data_array % TLE orbital elements from function TLE_processing_fcn

       %Scenario
       scenario_start_time      % Scenario Start Time
       scenario_stop_time       % Scenario Stop Time

       % Access
       access_start_time_str     % First propagation
       access_stop_time_str      % First propagation
       access_start_time_1       % First propagation
       access_stop_time_1        % First propagation
       access_start_time_2       % 2nd propagation
       access_stop_time_2        % 2nd propagation
       access_start_time_2_sband
       access_stop_time_2_sband
       access_start_time_2_uhf
       access_stop_time_2_uhf

       % Perigee
       peri_pass_time_1          % First propagation
       peri_pass_time_2          % 2end propagation

       % Maneuver
       maneuver_start_time  
       maneuver_stop_time
       maneuver_select_logic     % Logic array which indcates at which perigee passes manuever is selected
        
       % Activities Custom
       activityStartTime_custom 
       activityStopTime_custom

       % Attiude to STK
       sunpointing_start_time
       sunpointing_stop_time
       thrustpointing_start_time
       thrustpointing_stop_time
       targetpointing_start_time
       targetpointing_stop_time
       slew_start_time
       slew_stop_time
       slew_name

       % Attitude data from stk
       attitude_start_time % From all attitude profiles
       attitude_stop_time
       sunpointing_startstop_time % datetime array with [start time, stop time]
       thrustpointing_startstop_time
       targetpointing_startstop_time

       slew_startstop_time  % start and stop times for all slew maneuvers
       slew_startstop_s2th_time % start and stop times for slew sun to thrust pointing
       slew_startstop_th2s_time % start and stop times for slew thrust to sun pointing
       slew_startstop_s2ta_time % start and stop times for slew sun to target pointing
       slew_startstop_ta2s_time % start and stop times for slew target to sun pointing

       % SoE
       SoE      % Sequence of Events (tabel with all activitites together

    end


    properties (Access = private)
        DialogApp % Description
    end
    methods (Access = public)

        function ConsoleLog(app,newstr)
            app.ConsoleLogTextArea.Value =  [app.ConsoleLogTextArea.Value; newstr];
            scroll(app.ConsoleLogTextArea, 'bottom');
            %app.ConsoleLogTextArea.Value = str;
        end

        
        function [OE_array,TLE_epoch,epoch_jul] = TLE_processing_fcn(app,fname)
        % This function takes TLE as input from txt file and extracts orbital elements
        % Source: https://de.mathworks.com/matlabcentral/fileexchange/39364-two-line-element
        
        %   Epoch_vect = epoch
                
                fid = fopen(fname, 'r');        % Open the TLE file for reading
                OE_array = [];                  % Initialize an empty array to store orbital elements
                TLE_epoch = [];
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
                    TLE_epoch = [TLE_epoch; epoch];
                   
                end
                
                % Close the file
                fclose(fid);
            end
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: LoadmostrecentTLEButton
        function LoadmostrecentTLEButtonPushed(app, event)
            % Button shows orbital elements from TLE in table: TLEInfoTable
            % This function is completely indepenet from rest of the code,
            % only needs function TLE_processing_fcn
            
            % Acquire current TLE from python script (-> runs spacetrack library to get most recent TLE of chosen NORAD ID)
            % Python script writes the TLE to text file "current_TLE.txt"
            pyrunfile('C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\Mission_Planning_Tool\TLE_acquisition.py')
            
            % Get TLE txt file and extract orbital elements with TLE_processing_fcn function. Could also be done directly in python script with ephem or other library
            TLE_file = 'C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\Mission_Planning_Tool\current_TLE.txt';  % TLE file path\name
            [app.Orbit_data_array,app.TLE_Epoch] = TLE_processing_fcn(app,TLE_file); % function that extracts orbital elements from TLEs

            %[OE_array,tle_epoch] = TLE_processing_fcn(app,TLE_file); % function that extracts orbital elements from TLEs
            
            a = app.Orbit_data_array(:,1);
            ra = app.Orbit_data_array(:,4);
            rp = app.Orbit_data_array(:,5);
            ecc = app.Orbit_data_array(:,2);
            Incl = app.Orbit_data_array(:,3);
            RAAN = app.Orbit_data_array(:,6);
            ArgPeri = app.Orbit_data_array(:,7);
            MeanAno = app.Orbit_data_array(:,11);
            MeanMotion = app.Orbit_data_array(:,8); % Something wrong here, is it true anomaly?
            Db = app.Orbit_data_array(:,5); %ballistic coefficienbt
            Orbit_array_sorted = [ra rp a ecc Incl RAAN MeanAno ArgPeri MeanMotion Db];

            Name={'Apogee (km)','Perigee (km)','Semi-Major Axis (km)','Eccentrictiy','Inclination (deg)','RAAN (deg)','Mean Anomaly (deg)','Argument of Perigee (deg)','Mean Motion','Ballsistic Coef'};
            app.TLEInfoTable.Data=table(["TLE Epoch",Name]',[{app.TLE_Epoch},num2cell(Orbit_array_sorted)]');

        end

        % Button pushed function: ShowcurrentTLEButton
        function ShowcurrentTLEButtonPushed(app, event)
            TLE_file = 'C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\Mission_Planning_Tool\current_TLE.txt';  % TLE file path\name
            [app.Orbit_data_array,app.TLE_Epoch] = TLE_processing_fcn(app,TLE_file); % function that extracts orbital elements from TLEs

            %[OE_array,tle_epoch] = TLE_processing_fcn(app,TLE_file); % function that extracts orbital elements from TLEs
            
            a = app.Orbit_data_array(:,1);
            ra = app.Orbit_data_array(:,4);
            rp = app.Orbit_data_array(:,5);
            ecc = app.Orbit_data_array(:,2);
            Incl = app.Orbit_data_array(:,3);
            RAAN = app.Orbit_data_array(:,6);
            ArgPeri = app.Orbit_data_array(:,7);
            MeanAno = app.Orbit_data_array(:,11);
            MeanMotion = app.Orbit_data_array(:,8); % Something wrong here, is it true anomaly?
            Db = app.Orbit_data_array(:,5); %ballistic coefficienbt
            Orbit_array_sorted = [ra rp a ecc Incl RAAN MeanAno ArgPeri MeanMotion Db];

            Name={'Apogee (km)','Perigee (km)','Semi-Major Axis (km)','Eccentrictiy','Inclination (deg)','RAAN (deg)','Mean Anomaly (deg)','Argument of Perigee (deg)','Mean Motion','Ballistic Coefficient'};
            app.TLEInfoTable.Data=table(["TLE Epoch",Name]',[{app.TLE_Epoch},num2cell(Orbit_array_sorted)]');
        end

        % Button pushed function: PropagateButton
        function PropagateButtonPushed(app, event)
            %% Description
            % Takes TLE and extracts orbital elements with function (TLE_processing_fcn) and
            % uses them as input for HPOP. User enters scenario start and stop time
            % for which HPOP propagates orbit. Output are access and
            % perigee pass information and displays it in tables and a graph. 
            % 
            % Takes TLE, Time and Attitude from latest status from the satellite
            % Take user Input in the form of [Time, Maneuvre] as well as Start time
            % Runs STK scenario on these Inputs
            % Outputs TLE and Attitude as well as Power generated, Angular
            % acceleration, deltaV all over time for the next 72 hours%% Get Inputs
            %% Get Inputs from TLE and scenario start/stop time
            disp("Getting Input files")
            app.ConsoleLog("Getting Input files");
            
            % TLE----------------
            % TLE_file = 'C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\Mission_Planning_Tool\TLE_PEGASUS_07082023.txt';  % TLE file path\name
            
            % Acquire current TLE from python script (-> runs spacetrack library to get most recent TLE of chosen NORAD ID)
            % Python script writes the TLE to text file "current_TLE.txt"
            % pyrunfile('C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\Mission_Planning_Tool\TLE_acquisition.py')
            % 
            % % Get TLE txt file and extract orbital elements with TLE_processing_fcn function. Could also be done directly in python script with ephem or other library
            TLE_file = 'C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\Mission_Planning_Tool\current_TLE_2.txt';  % TLE file path\name
            [app.Orbit_data_array,app.TLE_Epoch] = TLE_processing_fcn(app,TLE_file); % function that extracts orbital elements from TLEs
            
            % Time----------------
            % Scenario time input
            app.scenario_start_time = app.ScenarioStartTimeEditField.Value;
            app.scenario_stop_time = app.ScenarioStopTimeEditField.Value;
            % start_time_value = datetime(app.Scenario_Start_Time, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
            % stop_time_value=datetime(app.Scenario_Stop_Time, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');

            %% Connect to STK

            % app.STKApp = actxGetRunningServer('STK12.application'); % Get running STK scenario 

            if isempty(app.STKApp) || ~iscom(app.STKApp)
                    app.STKApp = actxserver('STK12.Application');   % Open STK scenario
                    %app.STKApp.visible = false;
            end
            app.root = app.STKApp.Personality2;
                
            %% Open Scenario and set scenario time
            disp('Opening STK Scenario')
            app.ConsoleLog("Opening STK Scenario");
            
            scenario_file = 'C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\Mission_Planning_Tool\STK\CLIMB_scenario_v2\CLIMB_scenario1.sc';
            app.root.LoadScenario(scenario_file)

            scenario = app.root.CurrentScenario;
            scenario.SetTimePeriod(app.scenario_start_time,app.scenario_stop_time);
            scenario.StartTime = app.scenario_start_time;
            scenario.StopTime = app.scenario_stop_time;
            app.root.ExecuteCommand('Animate * Reset');
            
            %% Open Objects
            disp('Opening Objects')
            app.ConsoleLog("Opening Objects");
            
            app.CLIMB = scenario.Children.Item('CLIMB');       % Open Satellite CLIMB
            FHWN = scenario.Children.Item('FHWN');             % Ground Station
            Sensor = FHWN.Children.Item('Sensor');               % Sensor on ground station, cone half angle set in STK scenario
            % Access computed to FHWN (access diretly above horizon)
            % Access computed to Sensor (access x deg above horizon, x -> cone half angle adjusted in stk scenario)
            
            %% Set propagator, initial state and propagate over scenario timeframe

            % IAgSatellite satellite: Satellite object
            % HPOP Propagator (from code snipets:
            % https://help.agi.com/stkdevkit/11.4.0/Content/stkObjects/ObjModMatlabCodeSamples.htm)
            app.CLIMB.SetPropagatorType('ePropagatorHPOP');
            set(app.CLIMB.Propagator,'Step',60);       % Propagator time steps in seconds
            
            propagator = app.CLIMB.Propagator.InitialState.Representation.ConvertTo('eOrbitStateClassical');
            propagator.AssignCartesian('eCoordinateSystemTrueOfDate',6678.14,0,0,0,6.78953,3.68641);
            propagator.SizeShapeType = 'eSizeShapeAltitude';
            propagator.LocationType = 'eLocationMeanAnomaly';
            propagator.Orientation.AscNodeType = 'eAscNodeRAAN';

            % Additional HPOP Settings
            % forceModel = app.CLIMB.Propagator.ForceModel;
            % forceModel.CentralBodyGravity.File = 'C:\Program Files\AGI\STK 12\STKData\CentralBodies\Earth\WGS84_EGM96.grv';
            % forceModel.CentralBodyGravity.MaxDegree = 21;
            % forceModel.CentralBodyGravity.MaxOrder = 21;
            % forceModel.Drag.Use=1;
            % forceModel.Drag.DragModel.Cd=0.01;
            % forceModel.Drag.DragModel.AreaMassRatio=0.01;
            % forceModel.SolarRadiationPressure.Use=0;
            
            % integrator = app.CLIMB.Propagator.Integrator;
            % integrator.DoNotPropagateBelowAlt=-1e6;
            % integrator.IntegrationModel=3;
            % integrator.StepSizeControl.Method=1;
            % integrator.StepSizeControl.ErrorTolerance=1e-13;
            % integrator.StepSizeControl.MinStepSize=0.1;
            % integrator.StepSizeControl.MaxStepSize=30;
            % integrator.Interpolation.Method=1;
            % integrator.Interpolation.Order=7;
            
            % Initial State from TLE
            ra = app.Orbit_data_array(:,4);
            rp = app.Orbit_data_array(:,5);
            ecc = app.Orbit_data_array(:,2);
            Incl = app.Orbit_data_array(:,3);
            RAAN = app.Orbit_data_array(:,6);
            ArgPeri = app.Orbit_data_array(:,7);
            MeanAno = app.Orbit_data_array(:,11);
            
            propagator.SizeShape.ApogeeAltitude = ra;      % Apogee
            propagator.SizeShape.PerigeeAltitude = rp;     % Perigee 
            propagator.Orientation.Inclination = Incl;     % Inclination
            propagator.Orientation.AscNode.Value = RAAN;   % RAAN
            propagator.Orientation.ArgOfPerigee = ArgPeri; % Arg. Perigee
            propagator.Location.Value = MeanAno;           % True Anomaly
            
            % propagate
            app.CLIMB.Propagator.InitialState.Representation.Assign(propagator);
            app.CLIMB.Propagator.Propagate;


            %% Access Report and Visualization in Tabel: AccessTableInfo_1
            % Get acces start/stop time and duration
            disp('Getting access windows')
            app.ConsoleLog("Getting access windows");
            
            % Access computed to FHWN (access diretly above horizon)
            % Access computed to Sensor (access x deg above horizon, x -> cone half angle adjusted in stk scenario)
            access = app.CLIMB.GetAccessToObject(FHWN);
            %access = app.CLIMB.GetAccessToObject(Sensor);

            access.ComputeAccess;
            accessDP = access.DataProviders.Item('Access Data').Exec(scenario.StartTime,scenario.StopTime);
            
            % Start time
            app.access_start_time_1=datetime(accessDP.DataSets.GetDataSetByName('Start Time').GetValues, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
            app.access_start_time_str = datestr(app.access_start_time_1, 'dd mmm yyyy HH:MM:SS');
            app.access_start_time_str = cellstr(app.access_start_time_str);

            % Stop time
            app.access_stop_time_1=datetime(accessDP.DataSets.GetDataSetByName('Stop Time').GetValues, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
            app.access_stop_time_str= datestr(app.access_stop_time_1, 'dd mmm yyyy HH:MM:SS');
            app.access_stop_time_str=cellstr(app.access_stop_time_str);

            % Duration
            app.root.UnitPreferences.Item('Time').SetCurrentUnit('Min');
            accessDuration = accessDP.DataSets.GetDataSetByName('Duration').GetValues;
            
            % Max Elevation -> No report for max elev found in STK -> wtf?
            % Would need elevation report for every access and than maxEl = max(elevetion_report);
            % maneuver_output_report= app.CLIMB.DataProviders.Item('Maneuver Summary').Exec(app.Start_Time,app.End_Time);
            % app.maneuver_start_time_out=datetime(maneuver_output_report.DataSets.GetDataSetByName('Start Time').GetValues, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
            % maxElevation = accessDP.DataSets.GetDataSetByName('Start Time').GetValues;  % No report for max el!!!?!?!?!? annoying
            
            % Visualize access data in Table: AccessTableInfo_1
            access_id = 1:length(accessDuration);   % Access numbering
            app.AccessTableInfo_1.Data = table(access_id',app.access_start_time_1,app.access_stop_time_1,accessDuration);%,maxElevation);

            
            %% Perigee Passes Report and visualize data in ManeuverInputTable, PerigeePassDateTableInfo
            disp('Getting pergiee passes')
            app.ConsoleLog("Getting perigee passes");

            % Get Perigee pass data
            peri_pass_DP = app.CLIMB.DataProviders.Item('Passes').Exec(scenario.StartTime,scenario.StopTime);
            app.peri_pass_time_1 = datetime(peri_pass_DP.DataSets.GetDataSetByName('Time of Perigee').GetValues, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS')
            % IMPORTANT NOTE!
            % Somehow STK often also reports perigee pass after scenrio end
            % time (dont know why) which results in NaT value for the last
            % Perigee pass date. I tried to delete this with x(x==NaT)=[]
            % in many different ways but somwhow datetime doesnt find NaT
            % e.g. x==datetime("NaT") dosnt finde NaT in the array.
            % Therefore just the last column is deleted to get rid of it
            % however, this is not a good solution!!!
            app.peri_pass_time_1(end) = [];

            % Create table for maneuvers selection with checkbox and
            % overwrite check box to deselect all manuevers
            % IMPORTANT: deselect checkbox doesnt work!
            % IMPORTANT: If no manuever is selected, error for access report in second propagation
            checkboxColumn2 = true(height(app.peri_pass_time_1), 1); % create logical array for checkbox
            %peri_pass_table = [{'Remove all burns (Overwrite)', false}; peri_pass_table];
        

            % Visualize data in Tables: ManeuverInputTable, PerigeePassDateTableInfo
            app.ManeuverInputTable.Data = table([1:length(app.peri_pass_time_1)]',app.peri_pass_time_1,checkboxColumn2);         % Table for maneuver input
            app.PerigeePassDateTableInfo.Data = table([1:length(app.peri_pass_time_1)]',app.peri_pass_time_1);   % Table for perigee pass times
            
            %% Schedule Plot
            %-----------------------------------------------------------------
            %------------------- Plot-----------------------------------------
            %-----------------------------------------------------------------

            activity_names = {'Contact Windows', 'Perigee Passes'}; % for visualization on y-axis
            
            access_start = app.access_start_time_1;
            access_stop = app.access_stop_time_1;
            
            % Plot in app designer -> plot(app.SchedulePlot,x,y) 
            ax = app.SchedulePlot_2;
            plot(ax,app.peri_pass_time_1,2,'+','linewidth',0.5,'color','blue')
            plot(ax,[access_start access_stop],[1 1], 'linewidth',5,'color','green')
            
            ylim(ax, [0,3]);

            % Set y-axis labels
            yticks(ax,[1 2]);  % Position the ticks at the same locations as before
            yticklabels(ax,activity_names);            % Use activity names as labels

            %%  Console Log
            disp('App is running') % For progress track after button push
            app.ConsoleLog("App is running");
   
        end

        % Button pushed function: PropagateManeuversButton
        function PropagateManeuversButtonPushed(app, event)
         
%--------------------------------------------------------------------------------
%----------------------------- Second Propagation Button Pushed -----------------
%--------------------------------------------------------------------------------
            %% User Input
            thrust_duration = app.ManeuverDurationinminEditField.Value;
            thrust = app.ThrustNEditField.Value;
            Isp = app.IspsEditField.Value;
            thruster_efficiency = app.ThrusterEfficiencyEditField.Value; 

            %% Get Scencario and Objects
            scenario = app.root.CurrentScenario;
            FHWN = scenario.Children.Item('FHWN');
            Sensor = FHWN.Children.Item('Sensor');

            %% Set Propagator and Engine

            % IAgSatellite satellite: Satellite object
            % Astrogator Propagator (from code snipets:
            % https://help.agi.com/stkdevkit/11.4.0/Content/stkObjects/ObjModMatlabCodeSamples.htm)
            app.CLIMB.SetPropagatorType('ePropagatorAstrogator');
            astrogator = app.CLIMB.Propagator;
            astrogator.MainSequence.RemoveAll();    % Clear all segments from the MCS

            % Get the Engine Models Folder
            engine = scenario.ComponentDirectory.GetComponents('eComponentAstrogator').GetFolder('Engine Models');
            engine_model = engine.Item('Enpulsion');
            engine_model.Thrust = thrust;                         % Thrust - [N]
            engine_model.Isp = Isp;       
        
            %% Create Sequence

            %-------------------------Insert an initial state--------------------------
            initState1 = astrogator.MainSequence.Insert('eVASegmentTypeInitialState','Initail State','-');
            initState1.OrbitEpoch = app.scenario_start_time;
            
            % Initial State
            ra = app.Orbit_data_array(:,4);
            rp = app.Orbit_data_array(:,5);
            ecc = app.Orbit_data_array(:,2);
            Incl = app.Orbit_data_array(:,3);
            RAAN = app.Orbit_data_array(:,6);
            ArgPeri = app.Orbit_data_array(:,7);
            MeanAno = app.Orbit_data_array(:,11);

            % Elements:
            initState1.SetElementType('eVAElementTypeKeplerian');
            kep = initState1.Element;
            kep.ApoapsisAltitudeSize = ra;
            kep.Eccentricity = ecc;
            kep.Inclination = Incl;
            kep.RAAN = RAAN;
            kep.ArgOfPeriapsis = ArgPeri;
            kep.MeanAnomaly = MeanAno;
            
            % Spacecraft Parameters:
            sc = initState1.SpacecraftParameters;
            sc.DryMass = 4.5;                                      % dry mass - kg
            sc.Cd = 2.2;                                                 % coefficient Cd
            sc.DragArea = 0.08;                                           % Drag-area - m^2
            sc.Cr = 2;                                                 % coefficient Cr
            sc.SolarRadiationPressureArea = 0.07219; % Solar radiation pressure Pressure Area m^2
            sc.Ck= 0;                                                  % coefficient Cr
            sc.RadiationPressureArea = 0.079947;           % Radiation Pressure Area - m^2
            sc.K1 = 1; 
            sc.K2 = 1;
            
            % Fuel Tank:
            ft = initState1.FuelTank;
            ft.TankPressure = 5000;               % Tank pressure - Pa
            ft.TankVolume = 0.0006;                 % Tank Volume - m^2
            ft.TankTemperature = 429.75;            % Tank Temperature
            ft.FuelDensity = 7310;              % Fuel density - kg/m^3
            ft.FuelMass = 0.25;                % Fuel Mass - kg
            ft.MaximumFuelMass = 0.25;     % Maximum Fuel Mass - kg

            %   Manuever Input selection table
            %-------------------------------------------------------------------------------------------
        
            % Manuever Selection
            % x = x(x{:, 2} ~= 0, :); delete rows where x(:,2)==0 ("~" not % operator)
            maneuver_table_input = app.ManeuverInputTable.Data; % table with manuever data imput
            app.maneuver_select_logic = maneuver_table_input{:,3}; % maneuver selection (1 or 0)
            maneuver_table_input = maneuver_table_input(maneuver_table_input{:,3} ~=0,:); % delete unselected maneuvers

            maneuver_date = maneuver_table_input{:,2};  % selected maneuver dates
            maneuver_start_date = datetime(maneuver_date)-minutes(thrust_duration/2); % maneuver start date (perigee pass date - maneuver duration/2)
            maneuver_start_date = char(maneuver_start_date);    % Convert to char for STK input -> te get single elements maneuver_start_date(i,:)

            maneuvers_count = length(maneuver_date(:,1));
            maneuver_id = 1:maneuvers_count;

            % Loop which creates a propagaor segment and afterwards manuever segment. The propagator goes until
            % perigee_date-man_duration/2 
            %
            % IMPORTANT: The propagator does not consider the change of the
            % perigee time from other manuevers, it just uses the perigee
            % pass dates from the first propagation. This needs to be fixed!!!
            % Solution:
            % Option 1: Use the Perigee Pass stopping condition for the
            % propagator and set the manuever to "center burn". Probelm:
            % dont know how to set "center brun = true" in matlab
            % Option 2: Use true anomaly as stopping condition and calculte
            % true anomaly for thrust_time/2 before perigee pass (true anomly = 0)
            %------------------------------------------------------------------------------------------- 
            for i=1:length(app.maneuver_select_logic)
                %disp(i)
                %%----------------------------Insert Propagator-----------------------------
                
                astro_propagator_segment = astrogator.MainSequence.Insert('eVASegmentTypePropagate','Propage_1','-');
                astro_propagator_segment.PropagatorName = 'Earth HPOP Default v10';
                astro_propagator_segment.Properties.Color = 65280;     % green
                propagator1_stopcond = astro_propagator_segment.StoppingConditions.Add('Periapsis');
                propagator1_stopcond.Properties.RepeatCount = 1; % amount of circulation before proceeding
                %propagator1_stopcond.Properties.Trip = maneuver_start_date(i,:);
                astro_propagator_segment.StoppingConditions.Remove('Duration');
            
                %%----------------------------Insert Maneuver------------------------------
                % Wanted to make thurster parameter selection for every
                % manuever, however, the engine for all maneuvers is selected
                % when running the astrogator (driver.RunMCS;) therfore
                % using the last set engine parameters for all maneuvers

                % %Get the Engine Models Folder
                % engine = scenario.ComponentDirectory.GetComponents('eComponentAstrogator').GetFolder('Engine Models');
                % engine_model = engine.Item('Constant Thrust and Isp');
                % engine_model_clone = engine_model.CloneObject;
                % Engine = engine.Item(item(i));
                % Engine.Name = name(i);
                % Engine.Thrust = thrust_engine(i);                         % Thrust - [N]
                % Engine.Isp = Isp;                               % Specific Impulse - [s]
                % %Engine.Thrust = thrust_engine(i);
                % Engine:
                % astro_maneuver_segment.Maneuver.ThrustEfficiency = 1;
                % astro_maneuver_segment.Maneuver.SetPropulsionMethod('eVAPropulsionMethodEngineModel', 'Enpulsion'); % select engine fromm browser
                
                % Only do maneuver if selected in table, else skip it
                if app.maneuver_select_logic(i)==1
                    % Add Maneuver Segment
                    % astro_maneuver_segment = astrogator.MainSequence.Insert('eVASegmentTypeManeuver','Maneuver','-');  % Default maneuver
                    astro_maneuver_segment = astrogator.MainSequence.InsertByName('ManeuverClimbV1','-');  % Maneuver from component browser in STK
                    astro_maneuver_segment.Properties.Color = 16777215;    % color magenta
                    astro_maneuver_segment.Maneuver.ThrustEfficiency = thruster_efficiency;

                    % Maneuver propagator
                    prop_manu = astro_maneuver_segment.Maneuver.Propagator;
                    stopcond = prop_manu.StoppingConditions.Add('Duration');         % in min, dont know why
                    stopcond.Properties.Trip = thrust_duration;                 % in min, dont know why
                    prop_manu.StoppingConditions.Remove('Duration');
                end

            end
            %%----------------------------Insert End Propagator-----------------------
            % Insert last final propagator which propagates until scenario stop time
            % Without that, propagation would stop after last maneuver PROBLEM: Somehow if using the stopping condition "Epoch"
            % after a porpagator with stopping condition "Periapsis" the propagation is arounf 6 months long, despite havinf the right
            % stop date inserted. Therefore curretly stopping cond "duration" is used
            astro_propagator_segment = astrogator.MainSequence.Insert('eVASegmentTypePropagate','Propage_1','-');
            astro_propagator_segment.PropagatorName = 'Earth HPOP Default v10';
            astro_propagator_segment.Properties.Color = 65280;     % green
            % propagator1_stopcond = astro_propagator_segment.StoppingConditions.Add('Epoch');
            % propagator1_stopcond.Properties.Trip = app.scenario_stop_time;
            propagator1_stopcond = astro_propagator_segment.StoppingConditions.Add('Duration');
            propagator1_stopcond.Properties.Trip = 120; %minutes
            astro_propagator_segment.StoppingConditions.Remove('Duration');
            
            %astro_propagator_segment = astrogator.MainSequence.Insert('eVASegmentTypePropagate','Propage_1','-');
            %%----------------------------Run Astrogator-----------------------------
            astrogator.RunMCS; % This command runs the astrogator elements set above


            %% Access Report and Visualize in AccessTableInfo_2

            disp('Getting access windows')
            app.ConsoleLog("Getting access windows");
            
            % Data provider
            % Access computed to FHWN (access diretly above horizon)
            % Access computed to Sensor (access x deg above horizon, x -> cone half angle adjusted in stk scenario)
            access = app.CLIMB.GetAccessToObject(FHWN);
            access.ComputeAccess;
            accessDP = access.DataProviders.Item('Access Data').Exec(scenario.StartTime,scenario.StopTime);
            
            % Get access start/stop time and duration in min
            % Start/Stop Time
            app.access_start_time_2=datetime(accessDP.DataSets.GetDataSetByName('Start Time').GetValues, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
            app.access_stop_time_2=datetime(accessDP.DataSets.GetDataSetByName('Stop Time').GetValues, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');

            % Duration
            app.root.UnitPreferences.Item('Time').SetCurrentUnit('Min');
            accessDuration = accessDP.DataSets.GetDataSetByName('Duration').GetValues;

            % ---Create Access Table: AccessTableInfo_2 ---
            % ColumnName = {'Access Start','Access End','Access Duration','Access Select','Access Type'};
            checkbox_acc_sel = true(length(app.access_start_time_2), 1);     % create logical array for checkbox column
            access_type(1:length(app.access_start_time_2)) = {'UHF'};        % Create string array for inital drop down menu value        
            
            % For drop down menu, the Data cant be in table fomrat because it would ignore ColumnFormat (dont know why)
            app.AccessTableInfo_2.ColumnFormat = {[] [] [] [] {'UHF' 'S-Band'}};    % set format for columns, {} creates drop down menu
            app.AccessTableInfo_2.Data = [cellstr(app.access_start_time_2), cellstr(app.access_stop_time_2), accessDuration, num2cell(checkbox_acc_sel),access_type'];  
            
            
            % Notes for debugging
            % app.accessStartTimes_2      %4×1 datetime array
            % app.accessStopTimes_2       %4×1 datetime array
            % accessDuration              %4×1 cell array {[3.4296]}
            % checkbox_acc_sel            %4×1 logical array YES
            % access_type'                %4×1 cell array {'UHF'}
            % 
            % cellstr(app.accessStartTimes_2)     %4×1 cell array
            % cellstr(app.accessStopTimes_2)      %4×1 cell array
            % num2cell(accessDuration)            %4×1 cell array {1×1 cell}
            % num2cell(checkbox_acc_sel)          %4×1 cell array
            % myData = access_type'               %4×1 cell array %YES
         
            
            %% Perigee Pass Report and Visualize data in Table PerigeePassDateTableInfo_2
            disp('Getting pergiee passes')
            app.ConsoleLog("Getting perigee passes");
            
            % Get Perigee Pass Data
            peri_pass_DP = app.CLIMB.DataProviders.Item('Passes').Exec(app.scenario_start_time,app.scenario_stop_time);
            app.peri_pass_time_2 = datetime(peri_pass_DP.DataSets.GetDataSetByName('Time of Perigee').GetValues, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
            
            % IMPORTANT NOTE!
            % Somehow STK often also reports perigee pass after scenrio end
            % time (dont know why) which results in NaT value for the last
            % Perigee pass date. I tried to delete this with x(x==NaT)=[]
            % in many different ways but somwhow datetime doesnt find NaT
            % e.g. x==datetime("NaT") dosnt finde NaT in the array.
            % Therefore just the last column is deleted to get rid of it
            % however, this is not a good solution!!!
            app.peri_pass_time_2(end)=[];

            % Visualize data in Table: PerigeePassDateTableInfo_2
            app.PerigeePassDateTableInfo_2.Data = table([1:length(app.peri_pass_time_2)]',app.peri_pass_time_2);
            
            
            %% Maneuver Data Report and Visualiztion in Tables: ManeuverOutputTable, ManOutputGlobalTable
            
            maneuver_output_report = app.CLIMB.DataProviders.Item('Maneuver Summary').Exec(app.scenario_start_time,app.scenario_stop_time);
            app.maneuver_start_time = datetime(maneuver_output_report.DataSets.GetDataSetByName('Start Time').GetValues, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
            app.maneuver_stop_time = datetime(maneuver_output_report.DataSets.GetDataSetByName('Stop Time').GetValues, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
            maneuver_duration = maneuver_output_report.DataSets.GetDataSetByName('Duration').GetValues;
            maneuver_dv = maneuver_output_report.DataSets.GetDataSetByName('Delta V').GetValues;

            % From Code Snipptes
            % Code Snipptes = app.CLIMB.DataProviders.Item('Passes').Exec(app.Start_Time,app.End_Time);
            % app.per_pass_time=datetime(passes_res.DataSets.GetDataSetByName('Time of Perigee').GetValues, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
            % satPosDP = satellite.DataProviders.Item('Cartesian Position').Group.Item('ICRF').Exec(scenario.StartTime,scenario.StopTime,60);
            % satx = cell2mat(satPosDP.DataSets.GetDataSetByName('x').GetValues);
        
            % Data Visualization in Table: ManeuverOutputTable 
            app.ManeuverOutputTable.Data=table(maneuver_id',app.maneuver_start_time,app.maneuver_stop_time,maneuver_duration,maneuver_dv);
             
            % Data Visualization in Table: ManOutputGlobalTable 
            varname = {'Total Number Maneuvers','Total Delta-V (m/s)','Total Thrust Time (min)'};
            total_dv = sum(cell2mat(maneuver_dv));
            total_thrust_time = sum(cell2mat(maneuver_duration));
            app.ManOutputGlobalTable.Data = table(varname',[string(maneuvers_count), total_dv, total_thrust_time]');    % maneuvers_count to get rid of decimals (int32() didnt work)
            
            
        end

        % Button pushed function: AddAttitudeProfileButton
        function AddAttitudeProfileButtonPushed(app, event)
            %% Attitude
            % To insert attitude profile to STK see link below. It uses the root.ExecuteCommand() function with which every 
            % single attitude pointing mode or slew maneuver can be commanded to stk.
            % To insert e.g. a sun pointing segment starting at "06-Aug-2023 21:06:18", you do:
            % root.ExecuteCommand('AddAttitude */Satellite/CLIMB Profile SunPointing "06-Aug-2023 21:06:18" AlignConstrain Axis 1 1 0 "Sun" Axis 0 0 -1 "Velocity"')
            % -> (AddAttitude <ObjectPath> Profile [<ProfileName>] {StartTime} {ProfileType} <Parameters>)
            % For adding attitude profile to STK see: https://help.agi.com/stkdevkit/11.4.0/#../Subsystems/connectCmds/Content/cmd_AddAttitudeProfile.htm?Highlight=AddAttitude
            % And for different attitude modes: https://help.agi.com/stk/index.htm#attitude/attitudeBasicTypes.htm
            
            %% Extract S-Band and UHF access times from access table (AccessTableInfo_2)
            % Only s_band is used for pointing
            access_table_2 = app.AccessTableInfo_2.Data; % get access table
            index_sband = find(cell2mat(access_table_2(:,4))==1 & string(access_table_2(:,5))=="S-Band");   % find rows of of table where checkbox=true and s-band is selected
            index_uhf = find(cell2mat(access_table_2(:,4))==1 & string(access_table_2(:,5))=="UHF");        % find rows of of table where checkbox=true and uhf is selected

            % S-Band Start/stop times
            app.access_start_time_2_sband = app.access_start_time_2(index_sband);
            app.access_stop_time_2_sband = app.access_stop_time_2(index_sband);

            % UHF Start/stop times
            app.access_start_time_2_uhf = app.access_start_time_2(index_uhf);
            app.access_stop_time_2_uhf = app.access_stop_time_2(index_uhf);
 
            %% Get input values from GUI
            slew_duration = minutes(app.DurationminutesEditField.Value);
            leadtime_thrustpoint = minutes(app.LeadTimeminutesEditField.Value);
            trailtime_thrustpoint = minutes(app.TrailTimeminutesEditField.Value);
            leadtime_targetpoint = minutes(app.LeadTimeminutesEditField_2.Value);
            trailtime_targetpoint = minutes(app.TrailTimeminutesEditField_2.Value);

            %% Define attiude pointing and slew times

            % Thrust pointing start and stop times
            app.thrustpointing_start_time = app.maneuver_start_time-leadtime_thrustpoint;
            app.thrustpointing_stop_time = app.maneuver_stop_time+trailtime_thrustpoint;

            % Target pointing start and stop times
            app.targetpointing_start_time =  app.access_start_time_2_sband-leadtime_targetpoint;
            app.targetpointing_stop_time = app.access_stop_time_2_sband+trailtime_targetpoint;

            % Sun pointing start times (stop time defined below in section STK attitude report)
            % Sun point start date = [At beginning of scenario; after thrust + slew duration; after acess + slew duration]
            % Initial attitude of stk scenario is already sun pointing therefore no need to define initial attitudehere
            app.sunpointing_start_time = [app.thrustpointing_stop_time+slew_duration;... 
                                          app.targetpointing_stop_time+slew_duration];

            % Slew maneuvers start and stop times 
            % Slew start date = [before thrust; after thrust; before access; after access]
            app.slew_start_time = [app.thrustpointing_start_time-slew_duration;...
                                   app.thrustpointing_stop_time;...
                                   app.targetpointing_start_time-slew_duration;...
                                   app.targetpointing_stop_time];
            %app.slew_stop_time = app.slew_start_time+slew_duration;

            %% Attitude Profile Names
            sunpointing_name = "Sun_Pointing";
            thrustpointing_name = "Thrust_Pointing";
            targetpointing_name = "FHWN_Pointing";
            app.slew_name = ["Slew_sun_thrust","Slew_thrust_sun","Slew_sun_target","Slew_target_sun"];
            
            % Define names for different slews (not the most elegant solution, could be improved)
            % Slew type = [Slew_sun_thrust; Slew_thrust_sun; Slew_sun_target; Slew_target_sun]
            slew_1(1:length(app.thrustpointing_start_time)) = app.slew_name(1);
            slew_2(1:length(app.thrustpointing_start_time)) = app.slew_name(2);
            slew_3(1:length(app.targetpointing_start_time)) = app.slew_name(3);
            slew_4(1:length(app.targetpointing_stop_time)) = app.slew_name(4);
            slew_name_list = [slew_1 slew_2 slew_3 slew_4];

            %% Add attitude profile to STK via a command
            % Pre allocate arrays for attitude profile stk commands
            % Created for debugging
            thrustpointing_command = strings([length(app.thrustpointing_start_time),1]);
            targetpointing_command = strings([length(app.targetpointing_start_time),1]);
            sunpointing_command = strings([length(app.sunpointing_start_time),1]);
            slew_command = strings([length(app.slew_start_time),1]);
            
            for i=1:height(app.thrustpointing_start_time)
                thrustpointing_command(i) = append('AddAttitude */Satellite/CLIMB Profile ',thrustpointing_name,' "',string(app.thrustpointing_start_time(i)),'" AlignConstrain Axis 0 0 -1 "Velocity" Axis 1 1 0 "Sun"');
                % thrustpointing_command = 'AddAttitude */Satellite/CLIMB Profile Thrust_Pointing "06-Aug-2023 21:06:18" AlignConstrain Axis 0 0 -1 "Velocity" Axis 1 1 0 "Sun"';
                app.root.ExecuteCommand(thrustpointing_command(i));
            end
            for i=1:height(app.targetpointing_start_time)
                targetpointing_command(i) = append('AddAttitude */Satellite/CLIMB Profile ',targetpointing_name,' "',string(app.targetpointing_start_time(i)),'" AlignConstrain Axis 0 1 0 "FHWN" Axis 0 0 -1 "Velocity"');
                % targetpointing_command = 'AddAttitude */Satellite/CLIMB Profile Target_Pointing "06-Aug-2023 21:06:18" AlignConstrain Axis 0 1 0 "FHWN" Axis 0 0 -1 "Velocity"';
                app.root.ExecuteCommand(targetpointing_command(i));
                
            end
            for i=1:height(app.sunpointing_start_time)
                sunpointing_command(i) = append('AddAttitude */Satellite/CLIMB Profile ',sunpointing_name,' "',string(app.sunpointing_start_time(i)),'" AlignConstrain Axis 1 1 0 "Sun" Axis 0 0 -1 "Velocity"');
                % sunpointing_command = 'AddAttitude */Satellite/CLIMB Profile Sun_Pointing "06-Aug-2023 21:06:18" AlignConstrain Axis 1 1 0 "Sun" Axis 0 0 -1 "Velocity"';
                app.root.ExecuteCommand(sunpointing_command(i));
                
            end
            for i=1:height(app.slew_start_time)
                slew_command(i) = append('AddAttitude */Satellite/CLIMB Profile ',slew_name_list(i),' "',string(app.slew_start_time(i)),'" FixedTimeSlew Smooth On');
                % slew_command = 'AddAttitude */Satellite/CLIMB Profile Slew "06-Aug-2023 21:06:18" FixedTimeSlew Smooth On';
                app.root.ExecuteCommand(slew_command(i)); % maybe use char()
            end
                        
            %% Attitude Data Report and Visualiztion in Tables: AttitudeOutputTable, AttOutputGlobalTable

            % Get attitude data from STK
            attitudeDP = app.CLIMB.DataProviders.Item('Attitude Segment Schedule').Exec(app.scenario_start_time,app.scenario_stop_time);
            app.attitude_start_time = datetime(attitudeDP.DataSets.GetDataSetByName('Start Time').GetValues, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
            app.attitude_stop_time = datetime(attitudeDP.DataSets.GetDataSetByName('Stop Time').GetValues, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
            attitude_name = attitudeDP.DataSets.GetDataSetByName('Name').GetValues;
            attitude_type = attitudeDP.DataSets.GetDataSetByName('Description').GetValues;
            attitude_duration = app.attitude_stop_time-app.attitude_start_time;
            attitude_id = 1:length(app.attitude_start_time); % Number attitude profiles
            
            % Datetime array with [start time, stop time] for different type of attitude proflie
            % Used for global attitude statistics and for schedule graph.
            % This data is directly extracted from STK -> better than using the start and stop dates defined at beginning of chapter
            app.sunpointing_startstop_time = [app.attitude_start_time(attitude_name==sunpointing_name) app.attitude_stop_time(attitude_name==sunpointing_name)];
            app.thrustpointing_startstop_time = [app.attitude_start_time(attitude_name==thrustpointing_name) app.attitude_stop_time(attitude_name==thrustpointing_name)];
            app.targetpointing_startstop_time = [app.attitude_start_time(attitude_name==targetpointing_name) app.attitude_stop_time(attitude_name==targetpointing_name)];
            
            % Totel time of attitude profiles
            sunpointing_total_time = sum(app.sunpointing_startstop_time(:,2)-app.sunpointing_startstop_time(:,1));
            thrustpointing_total_time = sum(app.thrustpointing_startstop_time(:,2)-app.thrustpointing_startstop_time(:,1));
            targetpointing_total_time = sum(app.targetpointing_startstop_time(:,2)-app.targetpointing_startstop_time(:,1));

            %  Get slew start stop times for all slew maneuvers and seperately for slew maneuver types
            app.slew_startstop_time = [app.attitude_start_time(attitude_type=="Fixed Time Slew") app.attitude_stop_time(attitude_type=="Fixed Time Slew")];    % start and stop times for all slew maneuvers
            app.slew_startstop_s2th_time = [app.attitude_start_time(attitude_name==app.slew_name(1)) app.attitude_stop_time(attitude_name==app.slew_name(1))]; % start and stop times for slew sun to thrust pointing
            app.slew_startstop_th2s_time = [app.attitude_start_time(attitude_name==app.slew_name(2)) app.attitude_stop_time(attitude_name==app.slew_name(2))]; % start and stop times for slew thrust to sun pointing
            app.slew_startstop_s2ta_time = [app.attitude_start_time(attitude_name==app.slew_name(3)) app.attitude_stop_time(attitude_name==app.slew_name(3))]; % start and stop times for slew sun to target pointing
            app.slew_startstop_ta2s_time = [app.attitude_start_time(attitude_name==app.slew_name(4)) app.attitude_stop_time(attitude_name==app.slew_name(4))]; % start and stop times for slew target to sun pointing

            % Insert data to table AttitudeOutputTable
            app.AttitudeOutputTable.Data = table(attitude_id',attitude_name,app.attitude_start_time,app.attitude_stop_time,attitude_duration,attitude_type);

            % Data Visualization in Table: ManOutputGlobalTable 
            varname = {'Total Number Attitude Profiles','Number Slew Maneuvers','Total Time Sun Pointing','Total Time Thrust Pointing','Total Time Target (FHWN) Pointing'};
            app.AttitudeGlobalOutputTable.Data = table(varname', [num2cell(length(attitude_name)),num2cell(height(app.slew_startstop_time)),{sunpointing_total_time},{thrustpointing_total_time},{targetpointing_total_time}]');
            
        end

        % Button pushed function: ClearAttitudeButton
        function ClearAttitudeButtonPushed(app, event)
            % Clears all attiude profiles except the first one (sun pointing)

            app.root.ExecuteCommand('SetAttitude */Satellite/CLIMB ClearData AllProfiles');
            app.AttitudeOutputTable.Data = []; % clear attitude table


        end

        % Button pushed function: AddActivityButton
        function AddActivityButtonPushed(app, event)
            % Add Custom Activities, add to a table and plot in graph

            activityName = {app.ActivityNameEditField.Value}; % input from activity name text field and convert to cell with {}
            app.activityStartTime_custom = datetime(app.ActivityStartTimeEditField.Value,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
            app.activityStopTime_custom = datetime(app.ActivityStopTimeEditField.Value,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
            activityPower = app.PowerWEditField.Value;
            
            activityDuration = app.activityStopTime_custom-app.activityStartTime_custom;
            numRows = size(app.ActivityOutputTable.Data, 1); % Get the current number of rows

            % Create table with activity data and insert in new row in Table: ActivityOutputTable
            % Without numRows+1, it would overwrite the current activity row in table every time the "add activity" button is pushed
            newRow = table(numRows+1,activityName,app.activityStartTime_custom,app.activityStopTime_custom,activityDuration,activityPower);
            app.ActivityOutputTable.Data = [app.ActivityOutputTable.Data; newRow];

        end

        % Button pushed function: CreateActivityScheduleButton
        function CreateActivityScheduleButtonPushed(app, event)
            
            % SoE Table Output
            % Creates a list of all activities (manuevers, access times,
            % custom activites) and sorts it chronoligical with start_time
            % Every activity table needs same variable/column names -> VariableNames = ["Name","Start Time","Stop Time","Duration"];
            
            % ----manuevers----
            % try -> skips part if error occurs -> skips if e.g. no maneuvers planned
            try
            maneuver_id = 1:length(app.maneuver_start_time);
            manuever_name = append(string(maneuver_id'),"_Maneuver");    % Append maneuver number and "manuever" -> 1_maneuver, 2_...
            manuever_duration = app.maneuver_stop_time-app.maneuver_start_time;
            Maneuvers = table(manuever_name, app.maneuver_start_time, app.maneuver_stop_time,manuever_duration);
            Maneuvers.Properties.VariableNames = ["Name","Start Time","Stop Time","Duration"];
            end
            
            % ----Access Times----
            try
            % Selected access
            access_table_2 = app.AccessTableInfo_2.Data;
            access_table_2 = access_table_2(cell2mat(access_table_2(:,4)) ~= 0, :); % delete rows where x(:,2)==0 ("~" not operator)
            
            access_start = datetime(access_table_2(:,1));
            access_stop = datetime(access_table_2(:,2));
            access_duration = access_stop - access_start;
            access_mode = string(access_table_2(:,5));% string with "UHF" or "S-Band"
            access_id = 1:length(access_start);
            access_name = append(string(access_id'),"_Access_",access_mode); % Append access number, "access" and mode (UHF or S-Band) for name in SoE
            
            Access = table(access_name,access_start,access_stop,access_duration);
            Access.Properties.VariableNames = ["Name","Start Time","Stop Time","Duration"];
            end
            
            % ----Activities----
            try
            app.ActivityOutputTable.Data;
            Activities = app.ActivityOutputTable.Data;
            Activities(:,'Var1') = [];   % Remove Access ID
            Activities(:,'Var6') = [];   % Remove Power column
            Activities.Properties.VariableNames = ["Name","Start Time","Stop Time","Duration"];
            end
            
            % ----Attitude Times----
            try
            % Slew Sun to Thrust Pointing
            slew_id = 1:length(app.slew_startstop_s2th_time);
            slew_name_append = append(string(slew_id'),"_",app.slew_name(1));
            slew_table_s2th = table(slew_name_append,app.slew_startstop_s2th_time(:,1),app.slew_startstop_s2th_time(:,2),app.slew_startstop_s2th_time(:,2)-app.slew_startstop_s2th_time(:,1));
            slew_table_s2th.Properties.VariableNames = ["Name","Start Time","Stop Time","Duration"];
            
            % Slew Thrust to Sun Pointing
            slew_id = 1:length(app.slew_startstop_th2s_time);
            slew_name_append = append(string(slew_id'),"_",app.slew_name(2));
            slew_table_th2s = table(slew_name_append,app.slew_startstop_th2s_time(:,1),app.slew_startstop_th2s_time(:,2),app.slew_startstop_th2s_time(:,2)-app.slew_startstop_th2s_time(:,1));
            slew_table_th2s.Properties.VariableNames = ["Name","Start Time","Stop Time","Duration"];
            
            % Slew Sun to Target Pointing
            slew_id = 1:length(app.slew_startstop_s2ta_time);
            slew_name_append = append(string(slew_id'),"_",app.slew_name(3));
            slew_table_s2ta = table(slew_name_append,app.slew_startstop_s2ta_time(:,1),app.slew_startstop_s2ta_time(:,2),app.slew_startstop_s2ta_time(:,2)-app.slew_startstop_s2ta_time(:,1));
            slew_table_s2ta.Properties.VariableNames = ["Name","Start Time","Stop Time","Duration"];
            
            % Slew Target to Sun Pointing
            slew_id = 1:length(app.slew_startstop_ta2s_time);
            disp(slew_id)
            slew_name_append = append(string(slew_id'),"_",app.slew_name(4));
            disp(slew_name_append)
            slew_table_ta2s = table(slew_name_append,app.slew_startstop_ta2s_time(:,1),app.slew_startstop_ta2s_time(:,2),app.slew_startstop_ta2s_time(:,2)-app.slew_startstop_ta2s_time(:,1));
            disp(slew_table_ta2s)
            slew_table_ta2s.Properties.VariableNames = ["Name","Start Time","Stop Time","Duration"];
            end
            
            % ----Create and Sort SoE----
            app.SoE = [Maneuvers;Activities;Access;slew_table_s2th;slew_table_th2s;slew_table_s2ta;slew_table_ta2s];
            [~, idx] = sort(app.SoE{:,'Start Time'},'ascend');       % SoE{:,'Start Time'} -> datetime. Sort chronol with start time
            app.SoE = app.SoE(idx,:);
            SoE_activities_id = 1:height(app.SoE);
            app.SoE = [table(SoE_activities_id'),app.SoE];
            
            % Activity Table 
            app.SoETable.Data = app.SoE;

        end

        % Button pushed function: ConflictCheckButton
        function ConflictCheckButtonPushed(app, event)
            % Button checks for conflicts (overlap) of activities in SoE, shows
            % results in table: ConflictOutputTable and adds column with Time 
            % between activiteies in table: SoETable
                
            activity_start = datetime(app.SoE{:,'Start Time'});
            activity_stop = datetime(app.SoE{:,'Stop Time'});
            activity_start(1) = []; % delete first activity start time
            activity_stop(end) = [];  % delete last activity stop time
    
            time_between_activites = activity_start-activity_stop; % calculate duration between stop time of acitivty (activity_i) 
            % and start time of next activity (activity_i+1) 
            % If one of the durtions is negative e.g. -00:05:00, there is a conflict
    
            index_conflict = find(time_between_activites<0);    % finds index of duration<0
            number_conflicts = length(index_conflict);          % number of conflicts
            
            % Conflict output Table: ConflictOutputTable
            number_conf_out = append("Number Conflicts: ",string(number_conflicts));
            shortest_time_conflict = append("Shortest time between activities: ",string(min(time_between_activites)));
            app.ConflictOutputTable.Data = [number_conf_out; shortest_time_conflict];
    
            
            % Add column with Time between activiteies in table: SoETable
            timeBactivity = table([time_between_activites;duration('00:00:00')]);
            timeBactivity.Properties.VariableNames = "Time between Activities";
            app.SoETable.Data = [app.SoE, timeBactivity];
        

        end

        % Button pushed function: PlotScheduleButton
        function PlotScheduleButtonPushed(app, event)
            % Creates the schedule plot of all activities

            % Second Schedule Plot 
            yaxis_names = {'Attitude Pointing','Attitude Slew','Contact Windows','Perigee Passes','Maneuvers','Custom Activity'};
            % cla(app.SchedulePlot_2,app.SchedulePlot_8) % Delete all plots
            % ax=[app.SchedulePlot_2,app.SchedulePlot_8];
            cla(app.SchedulePlot_2) % Delete all plots
            ax=app.SchedulePlot_2;
            
            % ---------Plot---------
            % Use try/end to skip error if no access/manuever/activity data are available

            % ---Attitude---
            try
            % Plot pointing profiles
            plot(ax,[app.attitude_start_time(1),app.attitude_stop_time(1)],[1 1], 'linewidth',3,'color','yellow') % initial sun pointing segment
            plot(ax,app.sunpointing_startstop_time,[1 1], 'linewidth',3,'color','yellow')
            plot(ax,app.thrustpointing_startstop_time,[1 1], 'linewidth',3,'color','blue')
            plot(ax,app.targetpointing_startstop_time,[1 1], 'linewidth',3,'color','green')
            end
            % Plot slew profiles
            try
            plot(ax,app.slew_startstop_time,[2 2], 'linewidth',3,'color','black') 
            end
            

            % ---Access Data---
            try
            access_start = app.access_start_time_2;
            access_stop = app.access_stop_time_2;
            plot(ax,[access_start access_stop],[3 3], 'linewidth',5,'color','green')
            end

            try
            plot(ax,app.peri_pass_time_2,4,'+','linewidth',1,'color','blue')
            end

            % ---Maneuver Data---
            try
            man_start = app.maneuver_start_time;
            man_stop = app.maneuver_stop_time;
            plot(ax,[man_start man_stop],[5 5],'linewidth',1,'color','blue')
            end

            try
            activity_start = datetime(app.ActivityOutputTable.Data.Var3);
            activity_stop = datetime(app.ActivityOutputTable.Data.Var4);
            plot(ax,[activity_start activity_stop],[6 6],'linewidth',1,'color','#D95319')
            end
            
            % ---Plot Settings---
            % Set y-axis limit
            ylim(ax, [0,7])
            xlim(ax, [datetime(app.scenario_start_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS'),datetime(app.scenario_stop_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS')])

            % Set y-axis labels
            yticks(ax,[1 2 3 4 5 6]);  % Position the yaxis names
            yticklabels(ax,yaxis_names);            % Use activity names as labels

        end

        % Button pushed function: ADCSConstraintAnalysisButton
        function ADCSConstraintAnalysisButtonPushed(app, event)
            % Code from STP TorqueTool1.m
            % Main difference: Input for YPR values etc not from CSV files but
            % directly from STK
    
            %Misalignment_angle
                
            %% Creating Torque Report from STK
            disp('Creating Torque report')
            app.ConsoleLog("Creating Torque report");
            
            Torque = app.CLIMB.DataProviders.Item('Vectors(Body)').Group.Item('TotalTorque').Exec(app.scenario_start_time,app.scenario_stop_time,5);
            TorqueX=cell2mat(Torque.DataSets.GetDataSetByName('x').GetValues);
            TorqueY=cell2mat(Torque.DataSets.GetDataSetByName('y').GetValues);
            TorqueZ=cell2mat(Torque.DataSets.GetDataSetByName('z').GetValues);
            Torque_time = datetime(Torque.DataSets.GetDataSetByName('Time').GetValues, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
    
            %% Creating Angular Momentum Report from STK
            disp('Creating Angular Momentum report')
            app.ConsoleLog("Creating Angular Momentum report");
            
            AngMomentum = app.CLIMB.DataProviders.Item('Vectors(Body)').Group.Item('AngMomentum').Exec(app.scenario_start_time,app.scenario_stop_time,5);
            AngMomentumX = cell2mat(AngMomentum.DataSets.GetDataSetByName('x').GetValues);
            AngMomentumY = cell2mat(AngMomentum.DataSets.GetDataSetByName('y').GetValues);
            AngMomentumZ = cell2mat(AngMomentum.DataSets.GetDataSetByName('z').GetValues);
            AngMomentum_time = datetime(AngMomentum.DataSets.GetDataSetByName('Time').GetValues, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
    
    
            %% Creating angle change and angular velocity report
            disp('Creating angle change and angular velocity report')
            app.ConsoleLog("Creating angle change and angular velocity report");
            
            % YPR - Yaw, Pitch, Roll angels in deg
            YPR = app.CLIMB.DataProviders.Item('Attitude YPR').Group.Item('Seq RPY').Exec(app.scenario_start_time,app.scenario_stop_time,1);
            Yaw = cell2mat(YPR.DataSets.GetDataSetByName('Yaw').GetValues);
            Pitch = cell2mat(YPR.DataSets.GetDataSetByName('Pitch').GetValues);
            Roll = cell2mat(YPR.DataSets.GetDataSetByName('Roll').GetValues);
            YPR_time = datetime(YPR.DataSets.GetDataSetByName('Time').GetValues, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
            % Yaw_rate = cell2mat(YPR.DataSets.GetDataSetByName('Yaw Rate').GetValues);
            % Pitch_rate = cell2mat(YPR.DataSets.GetDataSetByName('Pitch Rate').GetValues);
            % Roll_rate = cell2mat(YPR.DataSets.GetDataSetByName('Roll Rate').GetValues);
     
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
    
            %% Constants Input from Torque_tool_data.xlsx
    
            Torque_tool_data  = readtable('C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\Mission_Planning_Tool\Torque_tool_data.xlsx');
            
            % CubeSat CAD data
            % Moment of Inertia
            I_xx = table2array(Torque_tool_data(2,2));    % kg*m^2 (Roll)
            I_yy = table2array(Torque_tool_data(3,2));    % kg*m^2 (Pitch)
            I_zz = table2array(Torque_tool_data(4,2));    % kg*m^2 (Yaw)
            
            % Center of Mass shift
            cm_x = table2array(Torque_tool_data(7,2));    % in m
            cm_y = table2array(Torque_tool_data(8,2));    % in m
            
            Height_z = table2array(Torque_tool_data(11,2));     % in m, distance from center of mass to propulsion system bottom
            
            % ADCS data sheet
            ADCS_max_L = table2array(Torque_tool_data(2,6));    % Max Angular momentum of ADCS in mNms
            ADCS_max_T = table2array(Torque_tool_data(1,6));    % Max torque of ADCS in mNm
            RPM_limit = table2array(Torque_tool_data(3,6));     % Max RPM of ADCS (8000 for CW0017 and 10000 for CW0057) 
            I_fw = table2array(Torque_tool_data(5,6));          % Moment of Inertia of ADCS in kg*m^2 (2.4E-05 for CW0017 and 7E-05 for CW0057 and CS has 0.1432 kg*m^2 (need 3.2 E-05))
            
            % ADCS last status from downlink data (initial state)
            RPM_wheel_initial=table2array(Torque_tool_data(15,6));
            L_x_cubesat_initial=table2array(Torque_tool_data(16,6));
            L_y_cubesat_initial=table2array(Torque_tool_data(17,6));
            L_z_cubesat_initial=table2array(Torque_tool_data(18,6));
            
            % Contributors to torque due to CM shift
            F = table2array(Torque_tool_data(15,2));        % Prop system thrust in N
            t_thrust = table2array(Torque_tool_data(16,2)); % Thrust time in s
                   
            % Contributors to torque due to thrust vector misallignment 
            Misalignment_angle = table2array(Torque_tool_data(17,2)); % in deg
       

            %%
            % Fire schedule
            % Fire_data=readtable("C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\STP\CLIMB Operation\Fire_schedule.csv",'HeaderLines', 1);
            % Fire_times = table2array(Fire_data(:,1));
            % Fire_status = table2array(Fire_data(:,2));
            Burn_time_status = zeros((size(YPR_time,1))-1,1); %  delta_L_x=zeros(size(L_x, 1), 1);
            
            for i = 1:height(app.maneuver_start_time)
        
                for j = 1:size(Burn_time_status)
                    if YPR_time(j)>app.maneuver_start_time(i) && YPR_time(j)<app.maneuver_stop_time(i)
        
                        Burn_time_status(j) = 1;
                    end
        
                end
        
            end

            %% Torque
            TorqueX = 1000*TorqueX; % mNm
            TorqueY = 1000*TorqueY; % mNm
            TorqueZ = 1000*TorqueZ; % mNm
        
            T=sqrt(TorqueX.^2+TorqueY.^2+TorqueZ.^2); % Abs. Torque
        
            Max_Torque = max(T);% Max. Torque
            disp(['Maximum Instantenious Torque (mNm): ', num2str(Max_Torque)]);
        
            cum_T_x = sum(TorqueX);
            cum_T_y = sum(TorqueY);
            cum_T_z = sum(TorqueZ);
            Total_torque = sqrt(cum_T_x^2+cum_T_y^2+cum_T_z^2);% Abs. Cum. Torque
            disp(['Total Torque (mNm): ', num2str(Max_Torque)]);

            %% Angular Momentum
            AngMomentumX=1000*AngMomentumX; % 1000*kg*m^2/sec= mNms % + L_cm_x*      
            AngMomentumY=1000*AngMomentumY; % 1000*kg*m^2/sec= mNms
            AngMomentumZ=1000*AngMomentumZ; % 1000*kg*m^2/sec= mNms
        
            L=sqrt(AngMomentumX.^2+AngMomentumY.^2+AngMomentumZ.^2);
            Max_L=max(L);
            disp(['Maximum instantaneous Angular Momentum (mNms) ', num2str(Max_L)]);
            
            delta_L_x=zeros(size(AngMomentumX, 1), 1);
            for i = 2:length(delta_L_x)
                delta_L_x_i = AngMomentumX(i);
                delta_L_x_iminus1 = AngMomentumX(i-1);
                delta_L_x(i) = AngMomentumX(i)-AngMomentumX(i-1);
            end
            AngMomentumX(1)=L_x_cubesat_initial+AngMomentumX(1);
            Cum_L_x=AngMomentumX(1)+cumsum(delta_L_x);
        
        
            delta_L_y=zeros(size(AngMomentumY, 1), 1);
            for i = 2:length(delta_L_y)
                delta_L_y_i = AngMomentumY(i);
                delta_L_y_iminus1 = AngMomentumY(i-1);
                delta_L_y(i) = AngMomentumY(i)-AngMomentumY(i-1);
            end
            AngMomentumY(1)=L_y_cubesat_initial+AngMomentumY(1);
            Cum_L_y=L(1)+cumsum(delta_L_y);
        
            delta_L_z=zeros(size(AngMomentumZ, 1), 1);
            for i = 2:length(delta_L_z)
                delta_L_z_i = AngMomentumZ(i);
                delta_L_z_iminus1 = AngMomentumZ(i-1);
                delta_L_z(i) = AngMomentumZ(i)-AngMomentumZ(i-1);
            end
            AngMomentumZ(1)=L_z_cubesat_initial+AngMomentumZ(1);
            Cum_L_z=L(1)+cumsum(delta_L_z);
        
            L_limit_pos=ADCS_max_L*ones(size(AngMomentum_time));
            L_limit_neg=-ADCS_max_L*ones(size(AngMomentum_time));
    
    
            %%  Angular velcoity derivation
            time_step = seconds(YPR_time(2) - YPR_time(1)); % Calculate the time step in seconds
            
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
            Thrust_momentum_PR=F*Height_z*sind(Misalignment_angle); % Either could be added to X or Y, roll or pitch, Nm
            Angular_momentum_misall_PR=cumtrapz(Thrust_momentum_PR*time_step*Burn_time_status);
        
            %% Total angular momentum   
            Angular_momentum_yaw_STK = (Yaw_rate*pi/180) * I_zz; % Nms
            Angular_momentum_pitch_STK = (Pitch_rate*pi/180) * I_yy;
            Angular_momentum_roll_STK = (Roll_rate*pi/180) * I_xx;
        
            Angular_momentum_yaw = Angular_momentum_yaw_STK ; % Nms
            Angular_momentum_pitch= Angular_momentum_pitch_STK + Thrust_momentum_pitch+Angular_momentum_misall_PR; 
            Angular_momentum_roll= Angular_momentum_roll_STK +Thrust_momentum_roll;
    
    
            %% RPM of the wheel
            RPM_x = Angular_momentum_roll/I_fw*30/pi+RPM_wheel_initial; 
            RPM_y = Angular_momentum_pitch/I_fw*30/pi+RPM_wheel_initial;
            RPM_z = Angular_momentum_yaw/I_fw*30/pi+RPM_wheel_initial;
            
            % figure Name RPM
            %     hold on
            %     plot(YPR_time(1:length(Yaw_rate)),RPM_x, 'Color', 'red','LineWidth',2)
            %     plot(YPR_time(1:length(Yaw_rate)),RPM_y, 'Color', 'black', 'LineWidth',2)
            %     plot(YPR_time(1:length(Yaw_rate)),RPM_z,'Color', 'green','LineWidth',2)
            % 
            %     yline(RPM_limit, '--', 'LineWidth',2, 'Color', 'red')
            %     yline(-RPM_limit, '--', 'LineWidth',2, 'Color', 'red')
            %     ylim([-8000 8000])
            %     xlabel('Time','FontSize',24,'FontWeight','bold') 
            %     ylabel('RPMs','FontSize',24,'FontWeight','bold') 
            %     legend({'RPM around x','RPM around y','RPM around z', ...
            %         'Upper Limit' ,'Lower Limit'},'Location','southeast','FontSize',24,'FontWeight','bold')
            %     set(gca,'FontSize', 24)
            %     hold off 
            
            try
            % Date where ADCS RPM limimt is reached
            ADCS_saturation_date = YPR_time(RPM_x>=RPM_limit | RPM_y>=RPM_limit | RPM_z>=RPM_limit);
            ADCS_saturation_date = ADCS_saturation_date(1);
            app.ConstraintTextArea.Value = append("Saturation Date: ",string(ADCS_saturation_date));
            catch
                app.ConstraintTextArea.Value = "No ADCS saturation limit exceeded";
            end
        
        
            %% Plot
        
            cla(app.SchedulePlot_13) % Delete all plots
            ax = app.SchedulePlot_13;
        
            plot(ax,YPR_time(1:length(Yaw_rate)),RPM_x,'color','#D95319')%,'linewidth',1,'color','#D95319')
            plot(ax,YPR_time(1:length(Yaw_rate)),RPM_y,'color','#0072BD')
            plot(ax,YPR_time(1:length(Yaw_rate)),RPM_z,'color','#EDB120')
        
            yline(ax,RPM_limit, '--', 'color','red')
            ylabel(ax,"RPM of Wheels")
            legend(ax,"Yaw","Pitch","Roll")
            xlim(ax, [datetime(app.scenario_start_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS'),datetime(app.scenario_stop_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS')])
            %-------------------------------------------
            cla(app.SchedulePlot_12) % Delete all plots
            ax = app.SchedulePlot_12;
        
            plot(ax,YPR_time(1:length(Yaw_rate)),RPM_x,'color','#D95319')%,'linewidth',1,'color','#D95319')
            plot(ax,YPR_time(1:length(Yaw_rate)),RPM_y,'color','#0072BD')
            plot(ax,YPR_time(1:length(Yaw_rate)),RPM_z,'color','#EDB120')
        
            yline(ax,RPM_limit, '--', 'color','red')
            ylabel(ax,"RPM of Wheels")
            legend(ax,"Yaw","Pitch","Roll")
            xlim(ax, [datetime(app.scenario_start_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS'),datetime(app.scenario_stop_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS')])
        
            %-------------------------------------------
            cla(app.SchedulePlot_11) % Delete all plots
            ax = app.SchedulePlot_11;
        
            plot(ax,YPR_time(1:length(Angular_momentum_yaw)),Angular_momentum_yaw,'color','#D95319')%,'linewidth',1,'color','#D95319')
            plot(ax,YPR_time(1:length(Angular_momentum_yaw)),Angular_momentum_pitch,'color','#0072BD')
            plot(ax,YPR_time(1:length(Angular_momentum_yaw)),Angular_momentum_roll,'color','#EDB120')
        
            yline(ax,ADCS_max_L/1000, '--', 'color','red')
            ylabel(ax,"Angular Momentum in Nms")
            legend(ax,"Yaw","Pitch","Roll")
            xlim(ax, [datetime(app.scenario_start_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS'),datetime(app.scenario_stop_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS')])
            
            
            %-------------------------------------------
            cla(app.SchedulePlot_9) % Delete all plots
            ax = app.SchedulePlot_9;
        
            plot(ax,YPR_time(1:length(Yaw)),Yaw,'color','#D95319')%,'linewidth',1,'color','#D95319')
            plot(ax,YPR_time(1:length(Yaw)),Pitch,'color','#0072BD')
            plot(ax,YPR_time(1:length(Yaw)),Roll,'color','#EDB120')
        
            % yline(ax,RPM_limit, '--', 'color','red')
            ylabel(ax,"YPR angels in deg")
            legend(ax,"Yaw","Pitch","Roll")
            xlim(ax, [datetime(app.scenario_start_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS'),datetime(app.scenario_stop_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS')])
            
            
            %-------------------------------------------
            cla(app.SchedulePlot_10) % Delete all plots
            ax = app.SchedulePlot_10;
        
            plot(ax,YPR_time(1:length(Yaw_rate)),Yaw_rate,'color','#D95319')%,'linewidth',1,'color','#D95319')
            plot(ax,YPR_time(1:length(Yaw_rate)),Pitch_rate,'color','#0072BD')
            plot(ax,YPR_time(1:length(Yaw_rate)),Roll_rate,'color','#EDB120')
        
            % yline(ax,RPM_limit, '--', 'color','red')
            ylabel(ax,"YPR rates in deg/s")
            legend(ax,"Yaw","Pitch","Roll")
            xlim(ax, [datetime(app.scenario_start_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS'),datetime(app.scenario_stop_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS')])
    
    
    
    
            % Creates the schedule plot of all activities
        
            % Second Schedule Plot 
            yaxis_names = {'Attitude Pointing','Attitude Slew','Contact Windows','Perigee Passes','Maneuvers','Custom Activity'};
            cla(app.SchedulePlot_8) % Delete all plots
            ax=app.SchedulePlot_8;
            
            % ---------Plot---------
            % Use try/end to skip error if no access/manuever/activity data are available
        
            % ---Attitude---
            try
            % Plot pointing profiles
            plot(ax,[app.attitude_start_time(1),app.attitude_stop_time(1)],[1 1], 'linewidth',3,'color','yellow') % initial sun pointing segment
            plot(ax,app.sunpointing_startstop_time,[1 1], 'linewidth',3,'color','yellow')
            plot(ax,app.thrustpointing_startstop_time,[1 1], 'linewidth',3,'color','blue')
            plot(ax,app.targetpointing_startstop_time,[1 1], 'linewidth',3,'color','green')
            end
            % Plot slew profiles
            try
            plot(ax,app.slew_startstop_time,[2 2], 'linewidth',3,'color','black') 
            end
            
        
            % ---Access Data---
            try
            access_start = app.access_start_time_2;
            access_stop = app.access_stop_time_2;
            plot(ax,[access_start access_stop],[3 3], 'linewidth',5,'color','green')
            end
        
            try
            plot(ax,app.peri_pass_time_2,4,'+','linewidth',1,'color','blue')
            end
        
            % ---Maneuver Data---
            try
            man_start = app.maneuver_start_time;
            man_stop = app.maneuver_stop_time;
            plot(ax,[man_start man_stop],[5 5],'linewidth',1,'color','blue')
            end
        
            try
            activity_start = datetime(app.ActivityOutputTable.Data.Var3);
            activity_stop = datetime(app.ActivityOutputTable.Data.Var4);
            plot(ax,[activity_start activity_stop],[6 6],'linewidth',1,'color','#D95319')
            end
            
            % ---Plot Settings---
            % Set y-axis limit
            ylim(ax, [0,7])
            xlim(ax, [datetime(app.scenario_start_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS'),datetime(app.scenario_stop_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS')])
        
            % Set y-axis labels
            yticks(ax,[1 2 3 4 5 6]);  % Position the yaxis names
            yticklabels(ax,yaxis_names);            % Use activity names as labels

            
        end

        % Button pushed function: PowerConstraintAnalysisButton
        function PowerConstraintAnalysisButtonPushed(app, event)
            disp('Creating Solar Power report')
            app.ConsoleLog("Creating Solar Power report");
            
            % Description: 
            % Input:
            % -CLIMB_Solar_Panel_Power CHECK
            % -Scenario_time CHECK
            % -Access_schedule CHECK
            % -Battery_InitialStatus_Model_Parameters CHECK
            % -CLIMB Power Budget V2 CHECK
            % -Fire_schedule CHECK
            % -RPM_overTime Left out for now
            
            % Output: 
            % -PowerTool.csv
            
            %% ----Create Fire_schedule.csv file----
            Fire_schedule_csv = table(app.peri_pass_time_2,app.maneuver_select_logic);
            Fire_schedule_csv.Properties.VariableNames = {'Perigee pass time', 'Propulsion On/ Off'};
            writetable(Fire_schedule_csv, 'C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\Mission_Planning_Tool\Output_CSV_files\Fire_schedule.csv');
    
            %% ----Create Scenario_time.csv file----
            Scenario_time_csv = table(datetime(app.scenario_start_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS'),datetime(app.scenario_stop_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS'));
            Scenario_time_csv.Properties.VariableNames = {'Scenario start time','Scenario stop time'};
            writetable(Scenario_time_csv, 'C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\Mission_Planning_Tool\Output_CSV_files\Scenario_time.csv');
                   
            %% ----Create Access_schedule.csv file----
            access_table_2 = app.AccessTableInfo_2.Data; % get access table
    
            % For access status, only calculate for access that is selected in GUI and is set to S-Band. 
            % In power budget, only S-band is considered since UHF data is sent via beacons all the time and without specific adcs settings
            index_sband = find(cell2mat(access_table_2(:,4))==1 & string(access_table_2(:,5))=="S-Band");
            access_select = zeros(length(app.access_start_time_2),1);
            access_select(index_sband) = 1;
            Access_schedule_csv = table(app.access_start_time_2,app.access_stop_time_2,app.access_stop_time_2-app.access_start_time_2,access_select);
            Access_schedule_csv.Properties.VariableNames = {'Access window start', 'Access window end', 'Access duration', 'Access Status'};
            writetable(Access_schedule_csv, 'C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\Mission_Planning_Tool\Output_CSV_files\Access_schedule.csv');
    
            %% ----Set the Solar Panel Tool----
            % More information in the link below
            % https://help.agi.com/stkdevkit/11.4.0/#../Subsystems/connectCmds/Content/cmd_VOSolarPanel.htm?Highlight=Solar%20Panel%20Tool
    
            % Set step size and watts as unit for power
            stepsize = 600; % Simulation step size in seconds
            app.root.UnitPreferences.Item('Power').SetCurrentUnit('W'); % default would be dBW
            
            % Define commands for power tool settings
            power_tool_command_addsolarpanels = "VO */Satellite/CLIMB SolarPanel Visualization Radius On 1 AddGroup Solar_Panels";
            power_tool_command_settings = append("VO */Satellite/CLIMB SolarPanel Compute",' "',app.scenario_start_time,'" "',app.scenario_stop_time,'" ',string(stepsize));
            % power_tool_command_settings must look like this: VO */Satellite/CLIMB SolarPanel Compute "6 Aug 2023 20:15:04.320" "9 Aug 2023 20:15:04.320" 600'
            
            % Ecxecute Solar Panel Tool Commands
            app.root.ExecuteCommand(power_tool_command_addsolarpanels);
            app.root.ExecuteCommand(power_tool_command_settings);
     
            % Get Report
            Solar = app.CLIMB.DataProviders.Item('Solar Panel Power').Exec(app.scenario_start_time,app.scenario_stop_time,stepsize);
            SolarTime = Solar.DataSets.GetDataSetByName('Time').GetValues;
            SolarPower = Solar.DataSets.GetDataSetByName('Power').GetValues;
            SolarIntensity = Solar.DataSets.GetDataSetByName('Solar Intensity').GetValues;
            
            %% ----Create CLIMB_Solar_Panel_Power.csv file----
            % Write CLIMB_Solar_Panel_Power.csv file
            SolarMatrix = [SolarTime,SolarPower,SolarIntensity];
            SolarTable = array2table(SolarMatrix);
            SolarTable.Properties.VariableNames(1:3) = {'Time (UTCG)','Power (W)','Solar Intensity'};
            writetable(SolarTable,'C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\Mission_Planning_Tool\Output_CSV_files\CLIMB_Solar_Panel_Power.csv');
    
            %% ----Run Python Power Tool and get Power Report----
            % Run Python power tool
            pyrunfile('C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\Mission_Planning_Tool\Power_Tool\PowerTool.py')
            
            % Get 
            power_tool_output_csv= readtable("C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\Mission_Planning_Tool\Power_Tool\PowerTool.csv", 'HeaderLines', 1);
            
            power_tool_time = datetime(table2cell(power_tool_output_csv(:,1)), 'InputFormat', 'dd-MM-yyyy HH:mm:ss');
            propulsion_power = table2array(power_tool_output_csv(:,2));
            downlink_power = table2array(power_tool_output_csv(:,3));
            total_power_consumed = table2array(power_tool_output_csv(:,4));
            power_generated = table2array(power_tool_output_csv(:,5));
            power_from_battery = table2array(power_tool_output_csv(:,6));
            bat_capacity = table2array(power_tool_output_csv(:,7));
            bat_SOC = table2array(power_tool_output_csv(:,8));
    
            %% Plot
            
            
            % ---- Batter SoC ----
            cla(app.SchedulePlot_14) % Delete all plots
            ax = app.SchedulePlot_14;
    
            plot(ax,power_tool_time,bat_SOC)
            yline(ax,35, '--', 'color','red')

            ylabel(ax,"Battery SoC")
            ylim(ax,[0,101])
            xlim(ax, [datetime(app.scenario_start_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS'),datetime(app.scenario_stop_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS')])
    
    
            % ----Power Generated----
            cla(app.SchedulePlot_4) % Delete all plots
            ax = app.SchedulePlot_4;
    
            plot(ax,power_tool_time,power_generated)
            
            ylabel(ax,"Power Generated in W")
            xlim(ax, [datetime(app.scenario_start_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS'),datetime(app.scenario_stop_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS')])
            
            % ----Power Consumption----
            cla(app.SchedulePlot_5) % Delete all plots
            ax = app.SchedulePlot_5;
    
            plot(ax,power_tool_time,total_power_consumed)
            
            ylabel(ax,"Power Consumption in W")
            xlim(ax, [datetime(app.scenario_start_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS'),datetime(app.scenario_stop_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS')])
    
            % ----Battery Power Output----
            cla(app.SchedulePlot_6) % Delete all plots
            ax = app.SchedulePlot_6;
    
            plot(ax,power_tool_time,power_from_battery)
            yline(ax,0, '--', 'color','black')
            
            ylabel(ax,"Battery Power Output in W")
            xlim(ax, [datetime(app.scenario_start_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS'),datetime(app.scenario_stop_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS')])
    
            % ---- Batter SoC ----
            cla(app.SchedulePlot_7) % Delete all plots
            ax = app.SchedulePlot_7;
    
            plot(ax,power_tool_time,bat_capacity)
            
            ylabel(ax,"Battery Capacitiy in Ah")
            xlim(ax, [datetime(app.scenario_start_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS'),datetime(app.scenario_stop_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS')])
    
    
            

            % Creates the schedule plot of all activities
        
            % Second Schedule Plot 
            yaxis_names = {'Attitude Pointing','Attitude Slew','Contact Windows','Perigee Passes','Maneuvers','Custom Activity'};
            cla(app.SchedulePlot_3) % Delete all plots
            ax=app.SchedulePlot_3;
            
            % ---------Plot---------
            % Use try/end to skip error if no access/manuever/activity data are available
        
            % ---Attitude---
            try
            % Plot pointing profiles
            plot(ax,[app.attitude_start_time(1),app.attitude_stop_time(1)],[1 1], 'linewidth',3,'color','yellow') % initial sun pointing segment
            plot(ax,app.sunpointing_startstop_time,[1 1], 'linewidth',3,'color','yellow')
            plot(ax,app.thrustpointing_startstop_time,[1 1], 'linewidth',3,'color','blue')
            plot(ax,app.targetpointing_startstop_time,[1 1], 'linewidth',3,'color','green')
            end
            % Plot slew profiles
            try
            plot(ax,app.slew_startstop_time,[2 2], 'linewidth',3,'color','black') 
            end
            
        
            % ---Access Data---
            try
            access_start = app.access_start_time_2;
            access_stop = app.access_stop_time_2;
            plot(ax,[access_start access_stop],[3 3], 'linewidth',5,'color','green')
            end
        
            try
            plot(ax,app.peri_pass_time_2,4,'+','linewidth',1,'color','blue')
            end
        
            % ---Maneuver Data---
            try
            man_start = app.maneuver_start_time;
            man_stop = app.maneuver_stop_time;
            plot(ax,[man_start man_stop],[5 5],'linewidth',1,'color','blue')
            end
        
            try
            activity_start = datetime(app.ActivityOutputTable.Data.Var3);
            activity_stop = datetime(app.ActivityOutputTable.Data.Var4);
            plot(ax,[activity_start activity_stop],[6 6],'linewidth',1,'color','#D95319')
            end
            
            % ---Plot Settings---
            % Set y-axis limit
            ylim(ax, [0,7])
            xlim(ax, [datetime(app.scenario_start_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS'),datetime(app.scenario_stop_time,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS')])
        
            % Set y-axis labels
            yticks(ax,[1 2 3 4 5 6]);  % Position the yaxis names
            yticklabels(ax,yaxis_names);            % Use activity names as labels


        end

        % Button pushed function: LongTermPropagateButton
        function LongTermPropagateButtonPushed(app, event)
%--------------------------------------------------------------------------
%---------------------- Long Term Propagation Tool ------------------------
%--------------------------------------------------------------------------

            % Description:
            
            
            
            %% Input
            start_date = app.StartTimeEditField.Value;
            %start_date = datetime(app.StartTimeEditField.Value,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
            skip_count = app.SkipeveryxmaneuverEditField.Value;
            maxIter = app.MaxIterationsEditField.Value;
            maxApoAlt = app.ApogeeAltitudekmEditField.Value;
            maxDate = app.StopTimeEditField.Value;

            thrust_duration = app.ManeuverDurationinminEditField_2.Value;
            thrust = app.ThrustNEditField_2.Value;
            Isp = app.IspsEditField_2.Value;
            thruster_efficiency = app.ThrusterEfficiencyEditField_2.Value ;

            % Get Scenario and Satellite
            scenario = app.root.CurrentScenario;
            app.CLIMB_longterm = scenario.Children.Item('CLIMB_LongTerm');       % Open Satellite CLIMB_LongTerm
            
            %% Set Engine Parameters

            % Get the Engine Models Folder
            engine = scenario.ComponentDirectory.GetComponents('eComponentAstrogator').GetFolder('Engine Models');
            engine_model = engine.Item('EnpulsionLongTerm');

            % Set Parameters
            engine_model.Thrust = thrust;
            engine_model.Isp = Isp;

            %% Set Astrogator
            disp('Set Astrogator')
            app.CLIMB_longterm.SetPropagatorType('ePropagatorAstrogator');
            astrogator = app.CLIMB_longterm.Propagator;
            astrogator.MainSequence.RemoveAll();    %Clear all segments from the MCS


            %% Create Sequence

            %----------------- Insert an initial state ----------------
            initState1 = astrogator.MainSequence.Insert('eVASegmentTypeInitialState','Initail State','-');
            initState1.OrbitEpoch = start_date;
            
            % Initial State
            ra = app.Orbit_data_array(:,4);
            rp = app.Orbit_data_array(:,5);
            ecc = app.Orbit_data_array(:,2);
            Incl = app.Orbit_data_array(:,3);
            RAAN = app.Orbit_data_array(:,6);
            ArgPeri = app.Orbit_data_array(:,7);
            MeanAno = app.Orbit_data_array(:,11);

            % Elements:
            initState1.SetElementType('eVAElementTypeKeplerian');
            kep = initState1.Element;
            kep.ApoapsisAltitudeSize = ra;
            kep.Eccentricity = ecc;
            kep.Inclination = Incl;
            kep.RAAN = RAAN;
            kep.ArgOfPeriapsis = ArgPeri;
            kep.MeanAnomaly = MeanAno;
            
            % Spacecraft Parameters:
            sc = initState1.SpacecraftParameters;
            sc.DryMass = 4.5;                                      % dry mass - kg
            sc.Cd = 2.2;                                                 % coefficient Cd
            sc.DragArea = 0.08;                                           % Drag-area - m^2
            sc.Cr = 2;                                                 % coefficient Cr
            sc.SolarRadiationPressureArea = 0.07219; % Solar radiation pressure Pressure Area m^2
            sc.Ck= 0;                                                  % coefficient Cr
            sc.RadiationPressureArea = 0.079947;           % Radiation Pressure Area - m^2
            sc.K1 = 1; 
            sc.K2 = 1;
            
            % Fuel Tank:
            ft = initState1.FuelTank;
            ft.TankPressure = 5000;               % Tank pressure - Pa
            ft.TankVolume = 0.0006;                 % Tank Volume - m^2
            ft.TankTemperature = 429.75;            % Tank Temperature
            ft.FuelDensity = 7310;              % Fuel density - kg/m^3
            ft.FuelMass = 0.25;                % Fuel Mass - kg
            ft.MaximumFuelMass = 0.25;     % Maximum Fuel Mass - kg
            
            %--------------------- First Propagator ------------------
            astro_propagator1_segment = astrogator.MainSequence.Insert('eVASegmentTypePropagate','Propagate1','-');
            astro_propagator1_segment.PropagatorName = 'Earth HPOP Default v10';
            astro_propagator1_segment.Properties.Color = 65280;     % green
            propagator1_stopcond = astro_propagator1_segment.StoppingConditions.Add('Periapsis');
            propagator1_stopcond.Properties.RepeatCount = 1; % amount of circulation before proceeding
            astro_propagator1_segment.StoppingConditions.Remove('Duration');
            
            %--------------------- Maneuver Segment -------------------
            astro_maneuver_segment = astrogator.MainSequence.InsertByName('ManeuverClimbV1','-');  % Maneuver from component browser in STK
            astro_maneuver_segment.Maneuver.ThrustEfficiency = thruster_efficiency;
            prop_manu = astro_maneuver_segment.Maneuver.Propagator;
            stopcond = prop_manu.StoppingConditions.Add('Duration');         % in min, dont know why
            stopcond.Properties.Trip = thrust_duration;                 % in min, dont know why
            prop_manu.StoppingConditions.Remove('Duration');
     
            %-------------------- Insert 2nd Propagator----------------
            astro_propagator2_segment = astrogator.MainSequence.Insert('eVASegmentTypePropagate','Propagate2','-');
            astro_propagator2_segment.PropagatorName = 'Earth HPOP Default v10';
            astro_propagator2_segment.Properties.Color = 65280;     % green
            propagator2_stopcond = astro_propagator2_segment.StoppingConditions.Add('Periapsis');
            propagator2_stopcond.Properties.RepeatCount = 1; % amount of circulation before proceeding
            astro_propagator2_segment.StoppingConditions.Remove('Duration');
            
            
            %% Set maneuver skip settings
            skip_maneuver = skip_count;
            maneuver_count = 0;

            %% ----------------------------Run Astrogator-----------------------------
            
            for i=1:maxIter

                disp(['--- Iteration: ', num2str(i),' ---'])

                % Delete Manuever segment if i==skipcount and run astrogator
                if(i==skip_maneuver)
                    astrogator.MainSequence.Remove("ManeuverClimbV1");
                    astrogator.RunMCS
                    disp(['Skip Maneuver',num2str(skip_maneuver)])
                else
                    astrogator.RunMCS
                    maneuver_count = maneuver_count+1;
                    maneuver_output_report = app.CLIMB_longterm.DataProviders.Item('Maneuver Summary').Exec(start_date,maxDate);
                    dv_array(maneuver_count) = maneuver_output_report.DataSets.GetDataSetByName('Delta V').GetValues;
                    disp("Fire")
                end
                
                % Delete first propagator segment after frist astrogator run
                if(i==1)
                    astrogator.MainSequence.Remove("Propagate1");
                end
                
                
                % Get updated orbital elements and set them as initial state
                Epoch_new{i} = astro_propagator2_segment.GetResultValue('Epoch');             % get date from the last step
                initState1.OrbitEpoch = Epoch_new{i};                           % geschwungene klammer sintax für cell array
            
                ra_new(i) = astro_propagator2_segment.GetResultValue('Altitude_Of_Apoapsis'); % get altitude of the apoapsis from the last step;
                kep.ApoapsisAltitudeSize = ra_new(i);
            
                rp_new(i) = astro_propagator2_segment.GetResultValue('Altitude_Of_Periapsis');
            
                Incl_new(i) = astro_propagator2_segment.GetResultValue('Inclination');
                kep.Inclination = Incl_new(i);
            
                RAAN_new(i) = astro_propagator2_segment.GetResultValue('RAAN');
                kep.RAAN = RAAN_new(i);
            
                ecc_new(i) = astro_propagator2_segment.GetResultValue('Eccentricity');        % get the value of the eccentritiy from the last step
                kep.Eccentricity = ecc_new(i);                                  % update the value
            
                ArgPeri_new(i) = astro_propagator2_segment.GetResultValue('Argument of Periapsis');
                kep.ArgOfPeriapsis = ArgPeri_new(i);
            
                TrueAno_new(i) = astro_propagator2_segment.GetResultValue('True_Anomaly');
                kep.TrueAnomaly = TrueAno_new(i);                               % value of Propagator END; stays const.
            
                
                if(i==skip_maneuver)
                    % Remove propagagor to insert manuever again infont of 2end propagator (must keep the right order)
                    astrogator.MainSequence.Remove("Propagate2");
                    
                    % Insert Manuever again
                    astro_maneuver_segment = astrogator.MainSequence.InsertByName('ManeuverClimbV1','-');  % Maneuver from component browser in STK
                    astro_maneuver_segment.Maneuver.ThrustEfficiency = thruster_efficiency;
                    prop_manu = astro_maneuver_segment.Maneuver.Propagator;
                    stopcond = prop_manu.StoppingConditions.Add('Duration');         % in min, dont know why
                    stopcond.Properties.Trip = thrust_duration;                 % in min, dont know why
                    prop_manu.StoppingConditions.Remove('Duration');
                    
                    % Insert 2end propagator again
                    astro_propagator2_segment = astrogator.MainSequence.Insert('eVASegmentTypePropagate','Propagate2','-');
                    astro_propagator2_segment.PropagatorName = 'Earth HPOP Default v10';
                    astro_propagator2_segment.Properties.Color = 65280;     % green
                    propagator2_stopcond = astro_propagator2_segment.StoppingConditions.Add('Periapsis');
                    propagator2_stopcond.Properties.RepeatCount = 1; % amount of circulation before proceeding
                    astro_propagator2_segment.StoppingConditions.Remove('Duration');
                    
                    % increase maneuver skip count
                    skip_maneuver=skip_maneuver+skip_count;
                    
                end
               
                %disp(datetime(Epoch_new(i),'InputFormat','dd MMM uuuu HH:mm:ss.SSS'))          
                disp(['Apogee = ', num2str(ra_new(i))])
                if(ra_new(i) >= maxApoAlt || datetime(Epoch_new{i},'InputFormat','dd MMM uuuu HH:mm:ss.SSS')>=datetime(maxDate,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS'))
                    break
                end
            end

            
            %% Output
            epoch_array = datetime(Epoch_new,'InputFormat','dd MMM uuuu HH:mm:ss.SSS');
            epoch_days = daysact(epoch_array(1),epoch_array(end));
            % years_pl = linspace(0,epoch_days,length(ra_new));
            epoch_array(end);
            Epoch_new(end);

            % Data Visualization in Table: ManueverGlobalLongTermTable 
            varname = {'Start Date', 'Stop Date', 'Total Time (days)', 'Total Apogee Rise (km)','Total Detla V (m/s)','Delta V per Maneuver', 'Total Number Maneuvers','Total Number Rotations'};
            
            total_time = days(epoch_array(end)-datetime(start_date,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS'));
            total_apo_rise = ra_new(end)-ra;
            total_dv = sum(cell2mat(dv_array));

            longterm_table = table(varname', [{start_date},Epoch_new(end),{total_time},num2cell(total_apo_rise),num2cell(total_dv),dv_array(end),num2cell(maneuver_count),num2cell(i)]');
            app.ManueverGlobalLongTermTable.Data = longterm_table;
            

            %% Plot

            cla(app.AltitudePlotLongTerm) % Delete all plots
            ax = app.AltitudePlotLongTerm;

            plot(ax,epoch_array,ra_new,'color','#0072BD')
            plot(ax,epoch_array,rp_new,'color','#D95319')
            
            legend(ax,"Apogee","Perigee")
            xlim(ax, [datetime(start_date,'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS'),datetime(epoch_array(end),'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS')])
        


        end

        % Button pushed function: ClearAstrogatorButton
        function ClearAstrogatorButtonPushed(app, event)
            % Clears Atrogator MCS from satellite CLIMB_LongTerm
            scenario = app.root.CurrentScenario;
            app.CLIMB_longterm = scenario.Children.Item('CLIMB_LongTerm');       % Open Satellite CLIMB_LongTerm
            astrogator = app.CLIMB_longterm.Propagator;
            astrogator.MainSequence.RemoveAll();    %Clear all segments from the MCS
            
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create CLIMBPredictorUIFigure and hide until all components are created
            app.CLIMBPredictorUIFigure = uifigure('Visible', 'off');
            app.CLIMBPredictorUIFigure.Color = [0.902 0.902 0.902];
            app.CLIMBPredictorUIFigure.Position = [100 100 1193 762];
            app.CLIMBPredictorUIFigure.Name = 'CLIMB Predictor';

            % Create PowertoolMenu
            app.PowertoolMenu = uimenu(app.CLIMBPredictorUIFigure);
            app.PowertoolMenu.Text = 'Power tool';

            % Create PowermodesMenu
            app.PowermodesMenu = uimenu(app.PowertoolMenu);
            app.PowermodesMenu.Text = 'Power modes';

            % Create PowerconsumptiondataMenu
            app.PowerconsumptiondataMenu = uimenu(app.PowertoolMenu);
            app.PowerconsumptiondataMenu.Text = 'Power consumption data';

            % Create BatterymodeldataMenu
            app.BatterymodeldataMenu = uimenu(app.PowertoolMenu);
            app.BatterymodeldataMenu.Text = 'Battery model data';

            % Create TorquetoolMenu
            app.TorquetoolMenu = uimenu(app.CLIMBPredictorUIFigure);
            app.TorquetoolMenu.Text = 'Torque tool';

            % Create TorquetooldataMenu
            app.TorquetooldataMenu = uimenu(app.TorquetoolMenu);
            app.TorquetooldataMenu.Text = 'Torque tool data';

            % Create Menu
            app.Menu = uimenu(app.CLIMBPredictorUIFigure);
            app.Menu.Text = 'Menu';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.CLIMBPredictorUIFigure);
            app.TabGroup.Position = [1 -1 1195 765];

            % Create SchedulerTab
            app.SchedulerTab = uitab(app.TabGroup);
            app.SchedulerTab.Title = 'Scheduler';

            % Create SchedulePlot_2
            app.SchedulePlot_2 = uiaxes(app.SchedulerTab);
            title(app.SchedulePlot_2, 'Schedule Plot')
            zlabel(app.SchedulePlot_2, 'Z')
            app.SchedulePlot_2.XGrid = 'on';
            app.SchedulePlot_2.YGrid = 'on';
            app.SchedulePlot_2.NextPlot = 'add';
            app.SchedulePlot_2.Position = [14 579 1170 139];

            % Create PlotScheduleButton
            app.PlotScheduleButton = uibutton(app.SchedulerTab, 'push');
            app.PlotScheduleButton.ButtonPushedFcn = createCallbackFcn(app, @PlotScheduleButtonPushed, true);
            app.PlotScheduleButton.Position = [51 550 100 23];
            app.PlotScheduleButton.Text = 'Plot Schedule';

            % Create TabGroup2
            app.TabGroup2 = uitabgroup(app.SchedulerTab);
            app.TabGroup2.Position = [1 -1 1194 524];

            % Create InitialStateTab
            app.InitialStateTab = uitab(app.TabGroup2);
            app.InitialStateTab.Title = 'Initial State';

            % Create TLEInfoTable
            app.TLEInfoTable = uitable(app.InitialStateTab);
            app.TLEInfoTable.ColumnName = {''; ''};
            app.TLEInfoTable.RowName = {};
            app.TLEInfoTable.Position = [20 21 280 317];

            % Create LoadmostrecentTLEButton
            app.LoadmostrecentTLEButton = uibutton(app.InitialStateTab, 'push');
            app.LoadmostrecentTLEButton.ButtonPushedFcn = createCallbackFcn(app, @LoadmostrecentTLEButtonPushed, true);
            app.LoadmostrecentTLEButton.Position = [145 384 147 23];
            app.LoadmostrecentTLEButton.Text = 'Load most recent TLE';

            % Create PropagateButton
            app.PropagateButton = uibutton(app.InitialStateTab, 'push');
            app.PropagateButton.ButtonPushedFcn = createCallbackFcn(app, @PropagateButtonPushed, true);
            app.PropagateButton.Position = [22 384 108 23];
            app.PropagateButton.Text = 'Propagate';

            % Create ScenarioStartTimeEditFieldLabel
            app.ScenarioStartTimeEditFieldLabel = uilabel(app.InitialStateTab);
            app.ScenarioStartTimeEditFieldLabel.HorizontalAlignment = 'right';
            app.ScenarioStartTimeEditFieldLabel.Position = [22 453 114 22];
            app.ScenarioStartTimeEditFieldLabel.Text = 'Scenario Start  Time';

            % Create ScenarioStartTimeEditField
            app.ScenarioStartTimeEditField = uieditfield(app.InitialStateTab, 'text');
            app.ScenarioStartTimeEditField.Position = [143 452 187 25];
            app.ScenarioStartTimeEditField.Value = '6 Aug 2023 20:15:04.320';

            % Create ScenarioStopTimeEditFieldLabel
            app.ScenarioStopTimeEditFieldLabel = uilabel(app.InitialStateTab);
            app.ScenarioStopTimeEditFieldLabel.HorizontalAlignment = 'right';
            app.ScenarioStopTimeEditFieldLabel.Position = [22 423 110 22];
            app.ScenarioStopTimeEditFieldLabel.Text = 'Scenario Stop Time';

            % Create ScenarioStopTimeEditField
            app.ScenarioStopTimeEditField = uieditfield(app.InitialStateTab, 'text');
            app.ScenarioStopTimeEditField.Position = [143 422 187 25];
            app.ScenarioStopTimeEditField.Value = '7 Aug 2023 20:15:04.320';

            % Create AccessTableInfo_1
            app.AccessTableInfo_1 = uitable(app.InitialStateTab);
            app.AccessTableInfo_1.ColumnName = {'ID'; 'Access Window Start'; 'Access Window Start'; 'Accesss Duration (min)'; 'Max Elevation (deg)'};
            app.AccessTableInfo_1.ColumnWidth = {30, 'auto'};
            app.AccessTableInfo_1.RowName = {};
            app.AccessTableInfo_1.Position = [319 17 584 322];

            % Create PerigeePassDateTableInfo
            app.PerigeePassDateTableInfo = uitable(app.InitialStateTab);
            app.PerigeePassDateTableInfo.ColumnName = {''; 'Perigee Pass Date'};
            app.PerigeePassDateTableInfo.ColumnWidth = {30, 'auto'};
            app.PerigeePassDateTableInfo.RowName = {};
            app.PerigeePassDateTableInfo.Position = [919 17 251 322];

            % Create ConsoleLogTextAreaLabel
            app.ConsoleLogTextAreaLabel = uilabel(app.InitialStateTab);
            app.ConsoleLogTextAreaLabel.HorizontalAlignment = 'right';
            app.ConsoleLogTextAreaLabel.FontWeight = 'bold';
            app.ConsoleLogTextAreaLabel.Position = [871 450 82 22];
            app.ConsoleLogTextAreaLabel.Text = 'Console Log:';

            % Create ConsoleLogTextArea
            app.ConsoleLogTextArea = uitextarea(app.InitialStateTab);
            app.ConsoleLogTextArea.Editable = 'off';
            app.ConsoleLogTextArea.Position = [877 379 294 64];
            app.ConsoleLogTextArea.Value = {'Logging'};

            % Create AccessDataLabel
            app.AccessDataLabel = uilabel(app.InitialStateTab);
            app.AccessDataLabel.FontWeight = 'bold';
            app.AccessDataLabel.Position = [577 339 76 24];
            app.AccessDataLabel.Text = 'Access Data';

            % Create PerigeePassesLabel
            app.PerigeePassesLabel = uilabel(app.InitialStateTab);
            app.PerigeePassesLabel.FontWeight = 'bold';
            app.PerigeePassesLabel.Position = [1000 338 93 24];
            app.PerigeePassesLabel.Text = 'Perigee Passes';

            % Create NORADIDLabel
            app.NORADIDLabel = uilabel(app.InitialStateTab);
            app.NORADIDLabel.HorizontalAlignment = 'right';
            app.NORADIDLabel.Position = [140 349 64 22];
            app.NORADIDLabel.Text = 'NORAD ID';

            % Create NORADIDEditField
            app.NORADIDEditField = uieditfield(app.InitialStateTab, 'numeric');
            app.NORADIDEditField.ValueDisplayFormat = '%.0f';
            app.NORADIDEditField.Position = [206 349 88 22];
            app.NORADIDEditField.Value = 56937;

            % Create ShowcurrentTLEButton
            app.ShowcurrentTLEButton = uibutton(app.InitialStateTab, 'push');
            app.ShowcurrentTLEButton.ButtonPushedFcn = createCallbackFcn(app, @ShowcurrentTLEButtonPushed, true);
            app.ShowcurrentTLEButton.Position = [22 349 108 23];
            app.ShowcurrentTLEButton.Text = 'Show current TLE';

            % Create Label
            app.Label = uilabel(app.InitialStateTab);
            app.Label.Position = [981 390 163 53];
            app.Label.Text = '';

            % Create ManeuverSelectionTab
            app.ManeuverSelectionTab = uitab(app.TabGroup2);
            app.ManeuverSelectionTab.Title = 'Maneuver Selection';

            % Create ManeuverInputTable
            app.ManeuverInputTable = uitable(app.ManeuverSelectionTab);
            app.ManeuverInputTable.ColumnName = {''; 'Perigee Pass Time'; 'Maneuver Select'};
            app.ManeuverInputTable.ColumnWidth = {30, 'auto', 70};
            app.ManeuverInputTable.RowName = {};
            app.ManeuverInputTable.ColumnEditable = [false false true];
            app.ManeuverInputTable.Position = [390 74 337 385];

            % Create PropagateManeuversButton
            app.PropagateManeuversButton = uibutton(app.ManeuverSelectionTab, 'push');
            app.PropagateManeuversButton.ButtonPushedFcn = createCallbackFcn(app, @PropagateManeuversButtonPushed, true);
            app.PropagateManeuversButton.Position = [495 22 133 40];
            app.PropagateManeuversButton.Text = 'Propagate Maneuvers';

            % Create ManeuverOutputTable
            app.ManeuverOutputTable = uitable(app.ManeuverSelectionTab);
            app.ManeuverOutputTable.ColumnName = {'ID'; 'Start Time'; 'Stop Time'; 'Duration (min)'; 'Delta-V (m/s)'};
            app.ManeuverOutputTable.ColumnWidth = {30, 'auto'};
            app.ManeuverOutputTable.RowName = {};
            app.ManeuverOutputTable.Position = [757 74 388 386];

            % Create ManOutputGlobalTable
            app.ManOutputGlobalTable = uitable(app.ManeuverSelectionTab);
            app.ManOutputGlobalTable.ColumnName = {''; ''};
            app.ManOutputGlobalTable.RowName = {};
            app.ManOutputGlobalTable.Position = [33 75 264 201];

            % Create ManeuverDurationinminEditFieldLabel
            app.ManeuverDurationinminEditFieldLabel = uilabel(app.ManeuverSelectionTab);
            app.ManeuverDurationinminEditFieldLabel.HorizontalAlignment = 'right';
            app.ManeuverDurationinminEditFieldLabel.Position = [11 435 150 22];
            app.ManeuverDurationinminEditFieldLabel.Text = 'Maneuver Duration in (min)';

            % Create ManeuverDurationinminEditField
            app.ManeuverDurationinminEditField = uieditfield(app.ManeuverSelectionTab, 'numeric');
            app.ManeuverDurationinminEditField.Position = [176 433 111 25];
            app.ManeuverDurationinminEditField.Value = 10;

            % Create IspsEditFieldLabel
            app.IspsEditFieldLabel = uilabel(app.ManeuverSelectionTab);
            app.IspsEditFieldLabel.HorizontalAlignment = 'right';
            app.IspsEditFieldLabel.Position = [123 406 38 22];
            app.IspsEditFieldLabel.Text = 'Isp (s)';

            % Create IspsEditField
            app.IspsEditField = uieditfield(app.ManeuverSelectionTab, 'numeric');
            app.IspsEditField.Position = [176 404 111 25];
            app.IspsEditField.Value = 1900;

            % Create ThrustNEditFieldLabel
            app.ThrustNEditFieldLabel = uilabel(app.ManeuverSelectionTab);
            app.ThrustNEditFieldLabel.HorizontalAlignment = 'right';
            app.ThrustNEditFieldLabel.Position = [102 376 59 22];
            app.ThrustNEditFieldLabel.Text = 'Thrust (N)';

            % Create ThrustNEditField
            app.ThrustNEditField = uieditfield(app.ManeuverSelectionTab, 'numeric');
            app.ThrustNEditField.Position = [176 374 111 25];
            app.ThrustNEditField.Value = 0.00035;

            % Create ActivityNameEditFieldLabel_4
            app.ActivityNameEditFieldLabel_4 = uilabel(app.ManeuverSelectionTab);
            app.ActivityNameEditFieldLabel_4.HorizontalAlignment = 'right';
            app.ActivityNameEditFieldLabel_4.Position = [902 469 98 22];
            app.ActivityNameEditFieldLabel_4.Text = 'Maneuver Output';

            % Create ActivityNameEditFieldLabel_5
            app.ActivityNameEditFieldLabel_5 = uilabel(app.ManeuverSelectionTab);
            app.ActivityNameEditFieldLabel_5.HorizontalAlignment = 'right';
            app.ActivityNameEditFieldLabel_5.Position = [495 469 111 22];
            app.ActivityNameEditFieldLabel_5.Text = 'Maneuver Selection';

            % Create ThrusterEfficiencyEditFieldLabel
            app.ThrusterEfficiencyEditFieldLabel = uilabel(app.ManeuverSelectionTab);
            app.ThrusterEfficiencyEditFieldLabel.HorizontalAlignment = 'right';
            app.ThrusterEfficiencyEditFieldLabel.Position = [57 344 104 22];
            app.ThrusterEfficiencyEditFieldLabel.Text = 'Thruster Efficiency';

            % Create ThrusterEfficiencyEditField
            app.ThrusterEfficiencyEditField = uieditfield(app.ManeuverSelectionTab, 'numeric');
            app.ThrusterEfficiencyEditField.Position = [176 342 111 25];
            app.ThrusterEfficiencyEditField.Value = 1;

            % Create AcitvitySchedulerTab
            app.AcitvitySchedulerTab = uitab(app.TabGroup2);
            app.AcitvitySchedulerTab.Title = 'Acitvity Scheduler';

            % Create AccessTableInfo_2
            app.AccessTableInfo_2 = uitable(app.AcitvitySchedulerTab);
            app.AccessTableInfo_2.ColumnName = {'Access Start'; 'Access End'; 'Access duration'; 'Access Select'; 'Access Type'};
            app.AccessTableInfo_2.RowName = {};
            app.AccessTableInfo_2.ColumnEditable = [false false false true true];
            app.AccessTableInfo_2.Position = [757 34 410 429];

            % Create ActivityOutputTable
            app.ActivityOutputTable = uitable(app.AcitvitySchedulerTab);
            app.ActivityOutputTable.ColumnName = {'Activity ID'; 'Activity Name'; 'Start Time'; 'Stop Time'; 'Duration (min)'; 'Power (W)'};
            app.ActivityOutputTable.RowName = {};
            app.ActivityOutputTable.Position = [329 34 398 429];

            % Create AddActivityButton
            app.AddActivityButton = uibutton(app.AcitvitySchedulerTab, 'push');
            app.AddActivityButton.ButtonPushedFcn = createCallbackFcn(app, @AddActivityButtonPushed, true);
            app.AddActivityButton.Position = [31 309 96 24];
            app.AddActivityButton.Text = 'Add Activity';

            % Create ActivityNameEditFieldLabel
            app.ActivityNameEditFieldLabel = uilabel(app.AcitvitySchedulerTab);
            app.ActivityNameEditFieldLabel.HorizontalAlignment = 'right';
            app.ActivityNameEditFieldLabel.Position = [41 439 78 22];
            app.ActivityNameEditFieldLabel.Text = 'Activity Name';

            % Create ActivityNameEditField
            app.ActivityNameEditField = uieditfield(app.AcitvitySchedulerTab, 'text');
            app.ActivityNameEditField.Position = [126 438 187 25];
            app.ActivityNameEditField.Value = 'Science Activity';

            % Create ActivityStartTimeEditFieldLabel
            app.ActivityStartTimeEditFieldLabel = uilabel(app.AcitvitySchedulerTab);
            app.ActivityStartTimeEditFieldLabel.HorizontalAlignment = 'right';
            app.ActivityStartTimeEditFieldLabel.Position = [11 409 104 22];
            app.ActivityStartTimeEditFieldLabel.Text = 'Activity Start Time ';

            % Create ActivityStartTimeEditField
            app.ActivityStartTimeEditField = uieditfield(app.AcitvitySchedulerTab, 'text');
            app.ActivityStartTimeEditField.Position = [126 408 187 25];
            app.ActivityStartTimeEditField.Value = '7 Aug 2023 02:15:00.000';

            % Create ActivityStopTimeEditFieldLabel
            app.ActivityStopTimeEditFieldLabel = uilabel(app.AcitvitySchedulerTab);
            app.ActivityStopTimeEditFieldLabel.HorizontalAlignment = 'right';
            app.ActivityStopTimeEditFieldLabel.Position = [11 379 104 22];
            app.ActivityStopTimeEditFieldLabel.Text = 'Activity Stop Time ';

            % Create ActivityStopTimeEditField
            app.ActivityStopTimeEditField = uieditfield(app.AcitvitySchedulerTab, 'text');
            app.ActivityStopTimeEditField.Position = [126 378 187 25];
            app.ActivityStopTimeEditField.Value = '7 Aug 2023 03:00:00.000';

            % Create PowerWEditFieldLabel
            app.PowerWEditFieldLabel = uilabel(app.AcitvitySchedulerTab);
            app.PowerWEditFieldLabel.HorizontalAlignment = 'right';
            app.PowerWEditFieldLabel.Position = [49 349 62 22];
            app.PowerWEditFieldLabel.Text = 'Power (W)';

            % Create PowerWEditField
            app.PowerWEditField = uieditfield(app.AcitvitySchedulerTab, 'numeric');
            app.PowerWEditField.Position = [126 347 187 26];

            % Create ActivityNameEditFieldLabel_2
            app.ActivityNameEditFieldLabel_2 = uilabel(app.AcitvitySchedulerTab);
            app.ActivityNameEditFieldLabel_2.HorizontalAlignment = 'right';
            app.ActivityNameEditFieldLabel_2.Position = [481 469 96 22];
            app.ActivityNameEditFieldLabel_2.Text = 'Custom Activities';

            % Create ActivityNameEditFieldLabel_3
            app.ActivityNameEditFieldLabel_3 = uilabel(app.AcitvitySchedulerTab);
            app.ActivityNameEditFieldLabel_3.HorizontalAlignment = 'right';
            app.ActivityNameEditFieldLabel_3.Position = [919 471 142 22];
            app.ActivityNameEditFieldLabel_3.Text = 'Ground Contact Selection';

            % Create PerigeePassDateTableInfo_2
            app.PerigeePassDateTableInfo_2 = uitable(app.AcitvitySchedulerTab);
            app.PerigeePassDateTableInfo_2.ColumnName = {''; 'New Perigee Pass Time'};
            app.PerigeePassDateTableInfo_2.ColumnWidth = {30, 'auto'};
            app.PerigeePassDateTableInfo_2.RowName = {};
            app.PerigeePassDateTableInfo_2.ColumnEditable = [true true true true];
            app.PerigeePassDateTableInfo_2.Position = [31 34 263 254];

            % Create AttitudeProfileTab
            app.AttitudeProfileTab = uitab(app.TabGroup2);
            app.AttitudeProfileTab.Title = 'Attitude Profile';

            % Create LeadTimeminutesEditFieldLabel
            app.LeadTimeminutesEditFieldLabel = uilabel(app.AttitudeProfileTab);
            app.LeadTimeminutesEditFieldLabel.HorizontalAlignment = 'right';
            app.LeadTimeminutesEditFieldLabel.Position = [32 312 114 22];
            app.LeadTimeminutesEditFieldLabel.Text = 'Lead Time (minutes)';

            % Create LeadTimeminutesEditField
            app.LeadTimeminutesEditField = uieditfield(app.AttitudeProfileTab, 'numeric');
            app.LeadTimeminutesEditField.Position = [161 310 77 26];
            app.LeadTimeminutesEditField.Value = 5;

            % Create TrailTimeminutesEditFieldLabel
            app.TrailTimeminutesEditFieldLabel = uilabel(app.AttitudeProfileTab);
            app.TrailTimeminutesEditFieldLabel.HorizontalAlignment = 'right';
            app.TrailTimeminutesEditFieldLabel.Position = [35 278 111 22];
            app.TrailTimeminutesEditFieldLabel.Text = 'Trail Time (minutes)';

            % Create TrailTimeminutesEditField
            app.TrailTimeminutesEditField = uieditfield(app.AttitudeProfileTab, 'numeric');
            app.TrailTimeminutesEditField.Position = [161 276 77 26];
            app.TrailTimeminutesEditField.Value = 5;

            % Create LeadTimeminutesEditField_2Label
            app.LeadTimeminutesEditField_2Label = uilabel(app.AttitudeProfileTab);
            app.LeadTimeminutesEditField_2Label.HorizontalAlignment = 'right';
            app.LeadTimeminutesEditField_2Label.Position = [32 186 114 22];
            app.LeadTimeminutesEditField_2Label.Text = 'Lead Time (minutes)';

            % Create LeadTimeminutesEditField_2
            app.LeadTimeminutesEditField_2 = uieditfield(app.AttitudeProfileTab, 'numeric');
            app.LeadTimeminutesEditField_2.Position = [161 184 77 26];
            app.LeadTimeminutesEditField_2.Value = 5;

            % Create TrailTimeminutesEditField_2Label
            app.TrailTimeminutesEditField_2Label = uilabel(app.AttitudeProfileTab);
            app.TrailTimeminutesEditField_2Label.HorizontalAlignment = 'right';
            app.TrailTimeminutesEditField_2Label.Position = [35 152 111 22];
            app.TrailTimeminutesEditField_2Label.Text = 'Trail Time (minutes)';

            % Create TrailTimeminutesEditField_2
            app.TrailTimeminutesEditField_2 = uieditfield(app.AttitudeProfileTab, 'numeric');
            app.TrailTimeminutesEditField_2.Position = [161 150 77 26];
            app.TrailTimeminutesEditField_2.Value = 5;

            % Create DurationminutesEditFieldLabel
            app.DurationminutesEditFieldLabel = uilabel(app.AttitudeProfileTab);
            app.DurationminutesEditFieldLabel.HorizontalAlignment = 'right';
            app.DurationminutesEditFieldLabel.Position = [41 411 104 22];
            app.DurationminutesEditFieldLabel.Text = 'Duration (minutes)';

            % Create AddAttitudeProfileButton
            app.AddAttitudeProfileButton = uibutton(app.AttitudeProfileTab, 'push');
            app.AddAttitudeProfileButton.ButtonPushedFcn = createCallbackFcn(app, @AddAttitudeProfileButtonPushed, true);
            app.AddAttitudeProfileButton.Position = [37 75 117 23];
            app.AddAttitudeProfileButton.Text = 'Add Attitude Profile';

            % Create AttitudeOutputTable
            app.AttitudeOutputTable = uitable(app.AttitudeProfileTab);
            app.AttitudeOutputTable.ColumnName = {''; 'Name'; 'Start Time'; 'Stop Time'; 'Duration'; 'Type'};
            app.AttitudeOutputTable.ColumnWidth = {30, 'auto'};
            app.AttitudeOutputTable.RowName = {};
            app.AttitudeOutputTable.Position = [277 46 629 418];

            % Create ClearAttitudeButton
            app.ClearAttitudeButton = uibutton(app.AttitudeProfileTab, 'push');
            app.ClearAttitudeButton.ButtonPushedFcn = createCallbackFcn(app, @ClearAttitudeButtonPushed, true);
            app.ClearAttitudeButton.Position = [37 46 117 23];
            app.ClearAttitudeButton.Text = 'Clear Attitude';

            % Create AttitudeGlobalOutputTable
            app.AttitudeGlobalOutputTable = uitable(app.AttitudeProfileTab);
            app.AttitudeGlobalOutputTable.ColumnName = '';
            app.AttitudeGlobalOutputTable.RowName = {};
            app.AttitudeGlobalOutputTable.Position = [929 45 230 419];

            % Create DurationminutesEditField
            app.DurationminutesEditField = uieditfield(app.AttitudeProfileTab, 'numeric');
            app.DurationminutesEditField.Position = [160 409 77 26];
            app.DurationminutesEditField.Value = 5;

            % Create TargetPointingLabel
            app.TargetPointingLabel = uilabel(app.AttitudeProfileTab);
            app.TargetPointingLabel.FontWeight = 'bold';
            app.TargetPointingLabel.Position = [101 215 92 22];
            app.TargetPointingLabel.Text = 'Target Pointing';

            % Create ThrustPointingLabel
            app.ThrustPointingLabel = uilabel(app.AttitudeProfileTab);
            app.ThrustPointingLabel.FontWeight = 'bold';
            app.ThrustPointingLabel.Position = [102 341 94 22];
            app.ThrustPointingLabel.Text = 'Thrust Pointing';

            % Create SlewLabel
            app.SlewLabel = uilabel(app.AttitudeProfileTab);
            app.SlewLabel.FontWeight = 'bold';
            app.SlewLabel.Position = [131 439 32 22];
            app.SlewLabel.Text = 'Slew';

            % Create SequenceofEventsTab
            app.SequenceofEventsTab = uitab(app.TabGroup2);
            app.SequenceofEventsTab.Title = 'Sequence of Events';

            % Create SoETable
            app.SoETable = uitable(app.SequenceofEventsTab);
            app.SoETable.ColumnName = {'ID'; 'Name'; 'Start Time'; 'Stop Time'; 'Duration'; 'Time to next Activity'};
            app.SoETable.ColumnWidth = {30, 'auto'};
            app.SoETable.RowName = {};
            app.SoETable.Position = [22 45 736 394];

            % Create CreateActivityScheduleButton
            app.CreateActivityScheduleButton = uibutton(app.SequenceofEventsTab, 'push');
            app.CreateActivityScheduleButton.ButtonPushedFcn = createCallbackFcn(app, @CreateActivityScheduleButtonPushed, true);
            app.CreateActivityScheduleButton.Position = [15 460 145 22];
            app.CreateActivityScheduleButton.Text = 'Create Activity Schedule';

            % Create ConflictCheckButton
            app.ConflictCheckButton = uibutton(app.SequenceofEventsTab, 'push');
            app.ConflictCheckButton.ButtonPushedFcn = createCallbackFcn(app, @ConflictCheckButtonPushed, true);
            app.ConflictCheckButton.Position = [803 290 100 23];
            app.ConflictCheckButton.Text = 'Conflict Check';

            % Create ConflictOutputTable
            app.ConflictOutputTable = uitable(app.SequenceofEventsTab);
            app.ConflictOutputTable.ColumnName = '';
            app.ConflictOutputTable.RowName = {};
            app.ConflictOutputTable.Position = [801 320 302 118];

            % Create ConstraintAnalysisTab_2
            app.ConstraintAnalysisTab_2 = uitab(app.TabGroup2);
            app.ConstraintAnalysisTab_2.Title = 'Constraint Analysis';

            % Create SchedulePlot_13
            app.SchedulePlot_13 = uiaxes(app.ConstraintAnalysisTab_2);
            title(app.SchedulePlot_13, 'RPM')
            zlabel(app.SchedulePlot_13, 'Z')
            app.SchedulePlot_13.XGrid = 'on';
            app.SchedulePlot_13.YGrid = 'on';
            app.SchedulePlot_13.NextPlot = 'add';
            app.SchedulePlot_13.Position = [15 175 1170 139];

            % Create SchedulePlot_14
            app.SchedulePlot_14 = uiaxes(app.ConstraintAnalysisTab_2);
            title(app.SchedulePlot_14, 'SoC')
            zlabel(app.SchedulePlot_14, 'Z')
            app.SchedulePlot_14.XGrid = 'on';
            app.SchedulePlot_14.YGrid = 'on';
            app.SchedulePlot_14.NextPlot = 'add';
            app.SchedulePlot_14.Position = [14 24 1170 139];

            % Create ConstraintTextArea
            app.ConstraintTextArea = uitextarea(app.ConstraintAnalysisTab_2);
            app.ConstraintTextArea.Position = [948 329 200 134];

            % Create PowerConstraintAnalysisButton
            app.PowerConstraintAnalysisButton = uibutton(app.ConstraintAnalysisTab_2, 'push');
            app.PowerConstraintAnalysisButton.ButtonPushedFcn = createCallbackFcn(app, @PowerConstraintAnalysisButtonPushed, true);
            app.PowerConstraintAnalysisButton.Position = [191 328 154 23];
            app.PowerConstraintAnalysisButton.Text = 'Power Constraint Analysis';

            % Create ADCSConstraintAnalysisButton
            app.ADCSConstraintAnalysisButton = uibutton(app.ConstraintAnalysisTab_2, 'push');
            app.ADCSConstraintAnalysisButton.ButtonPushedFcn = createCallbackFcn(app, @ADCSConstraintAnalysisButtonPushed, true);
            app.ADCSConstraintAnalysisButton.Position = [21 328 154 23];
            app.ADCSConstraintAnalysisButton.Text = 'ADCS Constraint Analysis';

            % Create InitialAngularMomentumfromADCSinNmsLabel
            app.InitialAngularMomentumfromADCSinNmsLabel = uilabel(app.ConstraintAnalysisTab_2);
            app.InitialAngularMomentumfromADCSinNmsLabel.Position = [26 445 246 22];
            app.InitialAngularMomentumfromADCSinNmsLabel.Text = 'Initial Angular Momentum from ADCS in Nms';

            % Create InitialBatteryCapacityEditFieldLabel
            app.InitialBatteryCapacityEditFieldLabel = uilabel(app.ConstraintAnalysisTab_2);
            app.InitialBatteryCapacityEditFieldLabel.HorizontalAlignment = 'right';
            app.InitialBatteryCapacityEditFieldLabel.Position = [304 443 124 22];
            app.InitialBatteryCapacityEditFieldLabel.Text = 'Initial Battery Capacity';

            % Create InitialBatteryCapacityEditField
            app.InitialBatteryCapacityEditField = uieditfield(app.ConstraintAnalysisTab_2, 'numeric');
            app.InitialBatteryCapacityEditField.Position = [436 443 100 22];

            % Create xLabel
            app.xLabel = uilabel(app.ConstraintAnalysisTab_2);
            app.xLabel.HorizontalAlignment = 'right';
            app.xLabel.Position = [15 416 25 22];
            app.xLabel.Text = 'x ';

            % Create xEditField
            app.xEditField = uieditfield(app.ConstraintAnalysisTab_2, 'numeric');
            app.xEditField.Position = [52 416 100 22];

            % Create yEditFieldLabel
            app.yEditFieldLabel = uilabel(app.ConstraintAnalysisTab_2);
            app.yEditFieldLabel.HorizontalAlignment = 'right';
            app.yEditFieldLabel.Position = [12 389 25 22];
            app.yEditFieldLabel.Text = 'y';

            % Create yEditField
            app.yEditField = uieditfield(app.ConstraintAnalysisTab_2, 'numeric');
            app.yEditField.Position = [52 389 100 22];

            % Create zEditFieldLabel
            app.zEditFieldLabel = uilabel(app.ConstraintAnalysisTab_2);
            app.zEditFieldLabel.HorizontalAlignment = 'right';
            app.zEditFieldLabel.Position = [12 361 25 22];
            app.zEditFieldLabel.Text = 'z';

            % Create zEditField
            app.zEditField = uieditfield(app.ConstraintAnalysisTab_2, 'numeric');
            app.zEditField.Position = [52 361 100 22];

            % Create ConstraintAnalysisTab
            app.ConstraintAnalysisTab = uitab(app.TabGroup);
            app.ConstraintAnalysisTab.Title = 'Constraint Analysis';

            % Create TabGroup4
            app.TabGroup4 = uitabgroup(app.ConstraintAnalysisTab);
            app.TabGroup4.Position = [1 1 1194 740];

            % Create PowerTab_2
            app.PowerTab_2 = uitab(app.TabGroup4);
            app.PowerTab_2.Title = 'Power';

            % Create SchedulePlot_3
            app.SchedulePlot_3 = uiaxes(app.PowerTab_2);
            title(app.SchedulePlot_3, 'Schedule Plot')
            zlabel(app.SchedulePlot_3, 'Z')
            app.SchedulePlot_3.XGrid = 'on';
            app.SchedulePlot_3.YGrid = 'on';
            app.SchedulePlot_3.NextPlot = 'add';
            app.SchedulePlot_3.Position = [11 570 1170 139];

            % Create SchedulePlot_4
            app.SchedulePlot_4 = uiaxes(app.PowerTab_2);
            title(app.SchedulePlot_4, 'Power Generation')
            zlabel(app.SchedulePlot_4, 'Z')
            app.SchedulePlot_4.XGrid = 'on';
            app.SchedulePlot_4.YGrid = 'on';
            app.SchedulePlot_4.NextPlot = 'add';
            app.SchedulePlot_4.Position = [71 430 1110 139];

            % Create SchedulePlot_5
            app.SchedulePlot_5 = uiaxes(app.PowerTab_2);
            title(app.SchedulePlot_5, 'Power Consumption')
            zlabel(app.SchedulePlot_5, 'Z')
            app.SchedulePlot_5.XGrid = 'on';
            app.SchedulePlot_5.YGrid = 'on';
            app.SchedulePlot_5.NextPlot = 'add';
            app.SchedulePlot_5.Position = [71 290 1110 139];

            % Create SchedulePlot_6
            app.SchedulePlot_6 = uiaxes(app.PowerTab_2);
            title(app.SchedulePlot_6, 'Battery Power Output')
            zlabel(app.SchedulePlot_6, 'Z')
            app.SchedulePlot_6.XGrid = 'on';
            app.SchedulePlot_6.YGrid = 'on';
            app.SchedulePlot_6.NextPlot = 'add';
            app.SchedulePlot_6.Position = [71 150 1110 139];

            % Create SchedulePlot_7
            app.SchedulePlot_7 = uiaxes(app.PowerTab_2);
            title(app.SchedulePlot_7, 'Battery SoC')
            zlabel(app.SchedulePlot_7, 'Z')
            app.SchedulePlot_7.XGrid = 'on';
            app.SchedulePlot_7.YGrid = 'on';
            app.SchedulePlot_7.NextPlot = 'add';
            app.SchedulePlot_7.Position = [71 10 1110 139];

            % Create ADCSTab_2
            app.ADCSTab_2 = uitab(app.TabGroup4);
            app.ADCSTab_2.Title = 'ADCS';

            % Create SchedulePlot_11
            app.SchedulePlot_11 = uiaxes(app.ADCSTab_2);
            title(app.SchedulePlot_11, 'Total Angular Momentum')
            zlabel(app.SchedulePlot_11, 'Z')
            app.SchedulePlot_11.XGrid = 'on';
            app.SchedulePlot_11.YGrid = 'on';
            app.SchedulePlot_11.NextPlot = 'add';
            app.SchedulePlot_11.Position = [61 147 1121 139];

            % Create SchedulePlot_8
            app.SchedulePlot_8 = uiaxes(app.ADCSTab_2);
            title(app.SchedulePlot_8, 'Schedule Plot')
            zlabel(app.SchedulePlot_8, 'Z')
            app.SchedulePlot_8.XGrid = 'on';
            app.SchedulePlot_8.YGrid = 'on';
            app.SchedulePlot_8.NextPlot = 'add';
            app.SchedulePlot_8.Position = [12 567 1170 139];

            % Create SchedulePlot_12
            app.SchedulePlot_12 = uiaxes(app.ADCSTab_2);
            title(app.SchedulePlot_12, 'RPM')
            zlabel(app.SchedulePlot_12, 'Z')
            app.SchedulePlot_12.XGrid = 'on';
            app.SchedulePlot_12.YGrid = 'on';
            app.SchedulePlot_12.NextPlot = 'add';
            app.SchedulePlot_12.Position = [61 7 1121 139];

            % Create SchedulePlot_9
            app.SchedulePlot_9 = uiaxes(app.ADCSTab_2);
            title(app.SchedulePlot_9, 'YPR')
            zlabel(app.SchedulePlot_9, 'Z')
            app.SchedulePlot_9.XGrid = 'on';
            app.SchedulePlot_9.YGrid = 'on';
            app.SchedulePlot_9.NextPlot = 'add';
            app.SchedulePlot_9.Position = [61 427 1121 139];

            % Create SchedulePlot_10
            app.SchedulePlot_10 = uiaxes(app.ADCSTab_2);
            title(app.SchedulePlot_10, 'YPR Rates')
            zlabel(app.SchedulePlot_10, 'Z')
            app.SchedulePlot_10.XGrid = 'on';
            app.SchedulePlot_10.YGrid = 'on';
            app.SchedulePlot_10.NextPlot = 'add';
            app.SchedulePlot_10.Position = [61 287 1121 139];

            % Create LongTermPropulsoinToolTab
            app.LongTermPropulsoinToolTab = uitab(app.TabGroup);
            app.LongTermPropulsoinToolTab.Title = 'Long-Term Propulsoin Tool';

            % Create AltitudePlotLongTerm
            app.AltitudePlotLongTerm = uiaxes(app.LongTermPropulsoinToolTab);
            xlabel(app.AltitudePlotLongTerm, 'Days')
            ylabel(app.AltitudePlotLongTerm, 'Altitude in km')
            zlabel(app.AltitudePlotLongTerm, 'Z')
            app.AltitudePlotLongTerm.XGrid = 'on';
            app.AltitudePlotLongTerm.YGrid = 'on';
            app.AltitudePlotLongTerm.NextPlot = 'add';
            app.AltitudePlotLongTerm.Position = [427 45 703 571];

            % Create ApogeeAltitudekmEditFieldLabel
            app.ApogeeAltitudekmEditFieldLabel = uilabel(app.LongTermPropulsoinToolTab);
            app.ApogeeAltitudekmEditFieldLabel.HorizontalAlignment = 'right';
            app.ApogeeAltitudekmEditFieldLabel.Position = [60 590 116 22];
            app.ApogeeAltitudekmEditFieldLabel.Text = 'Apogee Altitude (km)';

            % Create ApogeeAltitudekmEditField
            app.ApogeeAltitudekmEditField = uieditfield(app.LongTermPropulsoinToolTab, 'numeric');
            app.ApogeeAltitudekmEditField.Position = [191 590 112 22];
            app.ApogeeAltitudekmEditField.Value = 600;

            % Create MaxIterationsEditFieldLabel
            app.MaxIterationsEditFieldLabel = uilabel(app.LongTermPropulsoinToolTab);
            app.MaxIterationsEditFieldLabel.HorizontalAlignment = 'right';
            app.MaxIterationsEditFieldLabel.Position = [96 557 80 22];
            app.MaxIterationsEditFieldLabel.Text = 'Max Iterations';

            % Create MaxIterationsEditField
            app.MaxIterationsEditField = uieditfield(app.LongTermPropulsoinToolTab, 'numeric');
            app.MaxIterationsEditField.Position = [191 557 112 22];
            app.MaxIterationsEditField.Value = 5000;

            % Create ManeuverDurationinminEditField_2Label
            app.ManeuverDurationinminEditField_2Label = uilabel(app.LongTermPropulsoinToolTab);
            app.ManeuverDurationinminEditField_2Label.HorizontalAlignment = 'right';
            app.ManeuverDurationinminEditField_2Label.Position = [27 450 150 22];
            app.ManeuverDurationinminEditField_2Label.Text = 'Maneuver Duration in (min)';

            % Create ManeuverDurationinminEditField_2
            app.ManeuverDurationinminEditField_2 = uieditfield(app.LongTermPropulsoinToolTab, 'numeric');
            app.ManeuverDurationinminEditField_2.Position = [192 448 111 25];
            app.ManeuverDurationinminEditField_2.Value = 10;

            % Create IspsEditField_2Label
            app.IspsEditField_2Label = uilabel(app.LongTermPropulsoinToolTab);
            app.IspsEditField_2Label.HorizontalAlignment = 'right';
            app.IspsEditField_2Label.Position = [139 421 38 22];
            app.IspsEditField_2Label.Text = 'Isp (s)';

            % Create IspsEditField_2
            app.IspsEditField_2 = uieditfield(app.LongTermPropulsoinToolTab, 'numeric');
            app.IspsEditField_2.Position = [192 419 111 25];
            app.IspsEditField_2.Value = 1900;

            % Create ThrustNEditField_2Label
            app.ThrustNEditField_2Label = uilabel(app.LongTermPropulsoinToolTab);
            app.ThrustNEditField_2Label.HorizontalAlignment = 'right';
            app.ThrustNEditField_2Label.Position = [118 391 59 22];
            app.ThrustNEditField_2Label.Text = 'Thrust (N)';

            % Create ThrustNEditField_2
            app.ThrustNEditField_2 = uieditfield(app.LongTermPropulsoinToolTab, 'numeric');
            app.ThrustNEditField_2.Position = [192 389 111 25];
            app.ThrustNEditField_2.Value = 0.00035;

            % Create ThrusterEfficiencyEditField_2Label
            app.ThrusterEfficiencyEditField_2Label = uilabel(app.LongTermPropulsoinToolTab);
            app.ThrusterEfficiencyEditField_2Label.HorizontalAlignment = 'right';
            app.ThrusterEfficiencyEditField_2Label.Position = [73 359 104 22];
            app.ThrusterEfficiencyEditField_2Label.Text = 'Thruster Efficiency';

            % Create ThrusterEfficiencyEditField_2
            app.ThrusterEfficiencyEditField_2 = uieditfield(app.LongTermPropulsoinToolTab, 'numeric');
            app.ThrusterEfficiencyEditField_2.Position = [192 357 111 25];
            app.ThrusterEfficiencyEditField_2.Value = 1;

            % Create StopTimeEditFieldLabel
            app.StopTimeEditFieldLabel = uilabel(app.LongTermPropulsoinToolTab);
            app.StopTimeEditFieldLabel.HorizontalAlignment = 'right';
            app.StopTimeEditFieldLabel.Position = [117 622 59 22];
            app.StopTimeEditFieldLabel.Text = 'Stop Time';

            % Create StopTimeEditField
            app.StopTimeEditField = uieditfield(app.LongTermPropulsoinToolTab, 'text');
            app.StopTimeEditField.Position = [191 622 112 22];
            app.StopTimeEditField.Value = '6 Aug 2024 20:15:04.320';

            % Create StartTimeEditFieldLabel
            app.StartTimeEditFieldLabel = uilabel(app.LongTermPropulsoinToolTab);
            app.StartTimeEditFieldLabel.HorizontalAlignment = 'right';
            app.StartTimeEditFieldLabel.Position = [117 695 60 22];
            app.StartTimeEditFieldLabel.Text = 'Start Time';

            % Create StartTimeEditField
            app.StartTimeEditField = uieditfield(app.LongTermPropulsoinToolTab, 'text');
            app.StartTimeEditField.Position = [192 695 111 22];
            app.StartTimeEditField.Value = '6 Aug 2023 20:15:04.320';

            % Create LongTermPropagateButton
            app.LongTermPropagateButton = uibutton(app.LongTermPropulsoinToolTab, 'push');
            app.LongTermPropagateButton.ButtonPushedFcn = createCallbackFcn(app, @LongTermPropagateButtonPushed, true);
            app.LongTermPropagateButton.Position = [35 310 100 23];
            app.LongTermPropagateButton.Text = 'Propagate';

            % Create StoppingConditionLabel
            app.StoppingConditionLabel = uilabel(app.LongTermPropulsoinToolTab);
            app.StoppingConditionLabel.FontWeight = 'bold';
            app.StoppingConditionLabel.Position = [122 655 116 22];
            app.StoppingConditionLabel.Text = 'Stopping Condition';

            % Create SkipeveryxmaneuverEditFieldLabel
            app.SkipeveryxmaneuverEditFieldLabel = uilabel(app.LongTermPropulsoinToolTab);
            app.SkipeveryxmaneuverEditFieldLabel.HorizontalAlignment = 'right';
            app.SkipeveryxmaneuverEditFieldLabel.Position = [51 523 127 22];
            app.SkipeveryxmaneuverEditFieldLabel.Text = 'Skip every x maneuver';

            % Create SkipeveryxmaneuverEditField
            app.SkipeveryxmaneuverEditField = uieditfield(app.LongTermPropulsoinToolTab, 'numeric');
            app.SkipeveryxmaneuverEditField.Position = [190 523 113 22];

            % Create ManueverGlobalLongTermTable
            app.ManueverGlobalLongTermTable = uitable(app.LongTermPropulsoinToolTab);
            app.ManueverGlobalLongTermTable.ColumnName = '';
            app.ManueverGlobalLongTermTable.RowName = {};
            app.ManueverGlobalLongTermTable.Position = [34 85 269 174];

            % Create ClearAstrogatorButton
            app.ClearAstrogatorButton = uibutton(app.LongTermPropulsoinToolTab, 'push');
            app.ClearAstrogatorButton.ButtonPushedFcn = createCallbackFcn(app, @ClearAstrogatorButtonPushed, true);
            app.ClearAstrogatorButton.Position = [36 277 102 23];
            app.ClearAstrogatorButton.Text = 'Clear Astrogator';

            % Create ManeuverSettingsLabel
            app.ManeuverSettingsLabel = uilabel(app.LongTermPropulsoinToolTab);
            app.ManeuverSettingsLabel.FontWeight = 'bold';
            app.ManeuverSettingsLabel.Position = [126 480 112 22];
            app.ManeuverSettingsLabel.Text = 'Maneuver Settings';

            % Show the figure after all components are created
            app.CLIMBPredictorUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Mission_Planning_Tool_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.CLIMBPredictorUIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.CLIMBPredictorUIFigure)
        end
    end
end