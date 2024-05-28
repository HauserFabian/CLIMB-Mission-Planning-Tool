

% Get reference to running STK instance
uiApplication = actxGetRunningServer('STK12.application');
% Get our IAgStkObjectRoot interface
root = uiApplication.Personality2;
scenario = root.CurrentScenario;

climb = scenario.Children.Item('CLIMB');       % Open Satellite
FHWN = scenario.Children.Item('FHWN'); 

access = FHWN.GetAccessToObject(climb); % Set access objects
access.ComputeAccess;                           % Compute access


accessDP_1 = access.DataProviders.Item('Access Data').Exec(scenario.StartTime,scenario.StopTime); % Get report item and set report timeframe


%accessDP_2 = access.DataProviders.Item('AER Data').Group.Item('Default').Exec(scenario.StartTime,scenario.StopTime); % Get report item and set report timeframe
accessDP_2 = access.DataProviders.Item('AER Data').Group.Item('Default').Exec(scenario.StartTime,scenario.StopTime,60); % Get report item and set report timeframe

% Get access start/stop time and duration in min
% Start/Stop Time
% access_start_time_2 = datetime(accessDP_1.DataSets.GetDataSetByName('Start Time').GetValues, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
% access_stop_time_2 = datetime(accessDP_1.DataSets.GetDataSetByName('Stop Time').GetValues, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');

access_start_time_2 = accessDP_1.DataSets.GetDataSetByName('Start Time').GetValues;
access_stop_time_2 = accessDP_1.DataSets.GetDataSetByName('Stop Time').GetValues;

%app.root.UnitPreferences.Item('Time').SetCurrentUnit('Min');
accessDuration = accessDP_1.DataSets.GetDataSetByName('Duration').GetValues;

% Get Azimuth and Elevation data
%time = datetime(accessDP_2.DataSets.GetDataSetByName('Time').GetValues, 'InputFormat', 'd MMM yyyy HH:mm:ss.SSSSSSSSS');
%time = accessDP_2.DataSets.GetDataSetByName('Time').GetValues;
%elevation = accessDP_2.DataSets.GetDataSetByName('Elevation').GetValues
%azimuth = accessDP_2.DataSets.GetDataSetByName('Azimuth').GetValues
%allElevations=0;

maxElevastion(i) = zeros(length(access_start_time_2), 1);
azimuth_asce(i) = zeros(length(access_start_time_2), 1);
azimuth_desc(i) = zeros(length(access_start_time_2), 1);

for i=1:length(access_start_time_2)

    % time_2 = access_start_time_2(i)

    accessDP_2 = access.DataProviders.Item('AER Data').Group.Item('Default').Exec(access_start_time_2{i},access_stop_time_2{i},60);
    elevation = accessDP_2.DataSets.GetDataSetByName('Elevation').GetValues
    azimuth = accessDP_2.DataSets.GetDataSetByName('Azimuth').GetValues

    maxElevastion(i) = max(cell2mat(elevation))
    azimuth_asce(i) = cell2mat(azimuth(1))
    azimuth_desc(i) = cell2mat(azimuth(end))
    
    %allElevations = [allElevations; elevation];

end