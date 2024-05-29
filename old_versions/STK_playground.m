
%x = 'C:\Users\120960\FHWN\Master Thesis_cloud - Dokumente\10_MOS_Software\CLIMB Operation\CLIMB_scenario_v2';

% Get reference to running STK instance
uiApplication = actxGetRunningServer('STK12.application');
% Get our IAgStkObjectRoot interface
root = uiApplication.Personality2;
scenario = root.CurrentScenario;

climb = scenario.Children.Item('CLIMB');       % Open Satellite


% driver = climb.Propagator;
% MainSequence = driver.MainSequence;
% init_state = driver.MainSequence.GetItemByName('Initial State');
% Sequence = MainSequence.GetItemByName('Sequence');
% maneuver = driver.MainSequence.GetItemByName('Maneuver');
% maneuver_51 = scenario.ComponentDirectory.GetComponents('eComponentAstrogator').GetFolder('MCS Segments').Item('Maneuver51');

% insertman = driver.MainSequence.Insert('eVASegmentTypeManeuver','Maneuver','-'); % Default maneuver
% insertman = driver.MainSequence.InsertByName('Maneuver6','-'); % Maneuver from component browser
root.ExecuteCommand('Astrogator */Satellite/Satellite1 InsertSegment MainSequence.SegmentList.Maneuver51 Maneuver');  % Maneuver from component browser

% manuever_finit_satate = maneuver.FinalState.Element
% init_state_new = init_state.InitialState.Element
% init_state_new = manuever_finit_satate;

manuever_finit_satate = zeros(6,1);
init_state_new = zeros(6,1);

% for i=1:5
% propagator.RunMCS;
% 
% manuever_finit_satate(1) = maneuver.FinalState.Element.X;
% init_state.InitialState.Element.X = manuever_finit_satate(1);
% 
% manuever_finit_satate(2) = maneuver.FinalState.Element.Y;
% init_state.InitialState.Element.Y = manuever_finit_satate(2);
% 
% manuever_finit_satate(3) = maneuver.FinalState.Element.Z;
% init_state.InitialState.Element.Z = manuever_finit_satate(3);
% 
% manuever_finit_satate(4) = maneuver.FinalState.Element.Vx;
% init_state.InitialState.Element.Vx = manuever_finit_satate(4);
% 
% manuever_finit_satate(5) = maneuver.FinalState.Element.Vy;
% init_state.InitialState.Element.Vy = manuever_finit_satate(5);
% 
% manuever_finit_satate(6) = maneuver.FinalState.Element.Vz;
% init_state.InitialState.Element.Vz = manuever_finit_satate(6);
% 
% 
% 
% end


% manuever_finit_satate(1) = maneuver.FinalState.Element.X;
% manuever_finit_satate(2) = maneuver.FinalState.Element.Y;
% manuever_finit_satate(3) = maneuver.FinalState.Element.Z;
% manuever_finit_satate(4) = maneuver.FinalState.Element.Vx;
% manuever_finit_satate(5) = maneuver.FinalState.Element.Vy;
% manuever_finit_satate(6) = maneuver.FinalState.Element.Vz;

% command = 'AddAttitude */Satellite/CLIMB Profile Thrust "06-Aug-2023 21:06:18" AlignConstrain Axis 0 0 -1 "Velocity" Axis 1 1 0 "Sun"';
% 
% root.ExecuteCommand(command)