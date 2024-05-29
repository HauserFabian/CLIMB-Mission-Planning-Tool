%clc, close all, clear all

%% Scenario Time
disp('STK_Climb_opensc.m')

Start_Time = '6 Aug 2023 20:15:04.320';     % Must be the same as in the Scenario!
End_Time = '7 Aug 2023 20:15:04.320';       % Must be the same as in the Scenario!

scenario_name = 'Test12.sc';
%scenariofile_location = 'C:\Users\fabia\FHWN\Master Thesis_cloud - Documents\5_STK\Access_Analysis_V3\'; % must end with "\"
scenariofile_location = 'F:\STK_12\Scenarios\'; % must end with "\"

%% Connect to STK
disp('Connect to STK')
%app = actxserver('STK12.Application');
app = actxGetRunningServer('STK12.application');
root = app.Personality2;

%% Open/Create Scenario
disp('Open/Create Scenario')

% Open Scenario
% scenarioname = append(scenariofile_location,scenario_name);   % combine file location and name in one string
% root.LoadScenario(scenarioname)
% scenario = root.CurrentScenario;
% root.ExecuteCommand('Animate * Reset');

% Create Scenario
scenario = root.CurrentScenario;
%scenario = root.Children.New('eScenario','STK_Automation');
%scenario.SetTimePeriod(Start_Time,End_Time);
%scenario.StartTime = Start_Time;
%scenario.StopTime = End_Time;

root.ExecuteCommand('Animate * Reset');
%% Open/Add Objects
disp('Open/Create Objects')
satellite_climb = scenario.Children.Item('CLIMB_LongTerm');       % Open Satellite
%satellite_climb = scenario.Children.New('eSatellite','CLIMB_LongTerm');  % Create Satellite

%% Set Astrogator
disp('Set Astrogator')
satellite_climb.SetPropagatorType('ePropagatorAstrogator');
driver = satellite_climb.Propagator;
driver.MainSequence.RemoveAll();    %Clear all segments from the MCS

%% S/C Parameters
disp('S/C Parameters')

% Initial Orbit
ra = 500;
ecc = 0;
Incl = 97.4; %97.4
RAAN = 0;
ArgPeri = 0;
TrueAno = 0;
%ArgLat = 260;

% Thruster
thrust_time = 600; %240                        % Thruster operation time in sec
thrust = 0.00035;                           % Thrust in N
Isp = 1900;                                 % Specific Impulse in s

% S/C
mass_dry = 4.5;   %4                            % dry mass - kg
cd = 2.2;                                   % coefficient Cd
DA = 0.08; %0.18;                                  % Drag area - m^2
cr = 2;                                     % coefficient Cr
SolarRadiationPressureArea = 0.07219;       % Solar radiation pressure Pressure Area m^2
ck= 0;                                      % coefficient Cr
RadiationPressureArea = 0.079947;           % Radiation Pressure Area - m^2
k1 = 1;
k2 = 1;

% Fuel Tank
p_tank = 5000;                              % Tank pressure - Pa
V_tank = 0.0006;                            % Tank Volume - m^2
T_tank = 429.75;                            % Tank Temperature
rho_tank = 7310;                            % Fuel density - kg/m^3
mass_fuel = 0.25;                           % Fuel Mass - kg
mass_fuel_max = 0.25;                       % Maximum Fuel Mass - kg

%% Create a new Component browser:
disp('Create a new Component browser')

%Get the Engine Models Folder
engine = scenario.ComponentDirectory.GetComponents('eComponentAstrogator').GetFolder('Engine Models');
engine_model = engine.Item('Constant Thrust and Isp');
engine_model_clone = engine_model.CloneObject;

%Grab a handle of the new Engine Model and edit properties
newEngine = engine.Item('Constant Thrust and Isp1');
newEngine.Name = 'Enpulsion_2';
newEngine.Thrust = thrust;                         % Thrust - [N]
newEngine.Isp = Isp;                               % Specific Impulse - [s]

%% Create Sequence
disp('Create Sequence')

%-------------------------Insert an initial state--------------------------
initState1 = driver.MainSequence.Insert('eVASegmentTypeInitialState','Initail State','-');
initState1.OrbitEpoch = Start_Time;

% Elements:
initState1.SetElementType('eVAElementTypeKeplerian');
kep = initState1.Element;
kep.ApoapsisAltitudeSize = ra;
kep.Eccentricity = ecc;
kep.Inclination = Incl;
kep.RAAN = RAAN;
kep.ArgOfPeriapsis = ArgPeri;
%kep.ArgOfLatitude = 262.3901; %kep.ArgOfLatitude = arg_lat_fcn(ra,ecc,thrust_time);

% Spacecraft Parameters:
sc = initState1.SpacecraftParameters;
sc.DryMass = mass_dry;                                      % dry mass - kg
sc.Cd = cd;                                                 % coefficient Cd
sc.DragArea = DA;                                           % Drag-area - m^2
sc.Cr = cr;                                                 % coefficient Cr
sc.SolarRadiationPressureArea = SolarRadiationPressureArea; % Solar radiation pressure Pressure Area m^2
sc.Ck= ck;                                                  % coefficient Cr
sc.RadiationPressureArea = RadiationPressureArea;           % Radiation Pressure Area - m^2
sc.K1 = k1; 
sc.K2 = k2;

% Fuel Tank:
ft = initState1.FuelTank;
ft.TankPressure = p_tank;               % Tank pressure - Pa
ft.TankVolume = V_tank;                 % Tank Volume - m^2
ft.TankTemperature = T_tank;            % Tank Temperature
ft.FuelDensity = rho_tank;              % Fuel density - kg/m^3
ft.FuelMass = mass_fuel;                % Fuel Mass - kg
ft.MaximumFuelMass = mass_fuel_max;     % Maximum Fuel Mass - kg


%----------------------------First_propagator_peri-------------------------------
propagator3 = driver.MainSequence.Insert('eVASegmentTypePropagate','First_propagator_peri','-');
propagator3.PropagatorName = 'Earth HPOP Default v10';
propagator3.Properties.Color = 255; % red
propagator3_stopcond = propagator3.StoppingConditions.Add('Periapsis');
%propagator3_stopcond.Properties.Trip = 340.8281;   % 340.82809637266905 for thrust_time = 600 sec -> average between apo=500 and 1000
%propagator3_stopcond.Properties.Trip = MeanAno_thursttime_fcn(ra,ecc,thrust_time) % uses function to determine mean anomaly
propagator3_stopcond.Properties.RepeatCount = 1;
propagator3.StoppingConditions.Remove('Duration');          
%propagator3_stopcond.Properties.Criterion='eVACriterionCrossEither'; 
skip_value = 2;

%----------------------------Insert Maneuver-------------------------------
%in_manu = driver.MainSequence.Insert('eVASegmentTypeManeuver','Maneuver','-');
in_manu = driver.MainSequence.InsertByName('ManeuverClimbV1','-'); % Maneuver from component browser
%in_manu.SetManeuverType('eVAManeuverTypeFinite');
%in_manu.Properties.Color = 16711935;    % color magenta
maneuver1=in_manu.Maneuver;

% Attitude:
%maneuver1.SetAttitudeControlType('eVAAttitudeControlVelocityVector');
%alt_manu = maneuver1.AttitudeControl;

% Engine:
%maneuver1.ThrustEfficiency = 1;
maneuver1.SetPropulsionMethod('eVAPropulsionMethodEngineModel', 'Enpulsion 2'); % select engine fromm browser

% Maneuver Propagator:
prop_manu = maneuver1.Propagator;
trip = prop_manu.StoppingConditions.Add('Duration');
trip.Properties.Trip = thrust_time;                 % Trip count in - [Sec]
prop_manu.StoppingConditions.Remove('Duration');

%----------------------------Insert Propagator-----------------------------
% Three propagators are used to check if it has influence, usually only one
% necessary
% Proagator 1
% propagator1 = driver.MainSequence.Insert('eVASegmentTypePropagate','Propage_1','-');
% propagator1.PropagatorName = 'Earth HPOP Default v10';
% propagator1.Properties.Color = 65280;     % green
% propagator1_stopcond = propagator1.StoppingConditions.Add('True Anomaly');
% propagator1_stopcond.Properties.Trip = 120; % Propagates to true anomaly 120 deg
% propagator1_stopcond.Properties.RepeatCount = 1; % amount of circulation before increasing the orbit
% propagator1.StoppingConditions.Remove('Duration');
% propagator1_stopcond.Properties.Criterion='eVACriterionCrossEither';   %eVACriterionCrossIncreasing
% 
% % Proagator 2
% propagator2 = driver.MainSequence.Insert('eVASegmentTypePropagate','Propage_1','-');
% propagator2.PropagatorName = 'Earth HPOP Default v10';
% propagator2.Properties.Color = 16777215; % white
% propagator2_stopcond = propagator2.StoppingConditions.Add('True Anomaly');
% propagator2_stopcond.Properties.Trip = 240; % Propagates to true anomaly 240 deg
% propagator2_stopcond.Properties.RepeatCount = 1;                       % amount of circulation before increasing the orbit
% propagator2.StoppingConditions.Remove('Duration');
% propagator2_stopcond.Properties.Criterion='eVACriterionCrossEither'; 

% Proagator 3
propagator3 = driver.MainSequence.Insert('eVASegmentTypePropagate','Propage_1','-');
propagator3.PropagatorName = 'Earth HPOP Default v10';
propagator3.Properties.Color = 255; % red
propagator3_stopcond = propagator3.StoppingConditions.Add('Periapsis');
%propagator3_stopcond.Properties.Trip = 340.8281;   % 340.82809637266905 for thrust_time = 600 sec -> average between apo=500 and 1000
%propagator3_stopcond.Properties.Trip = MeanAno_thursttime_fcn(ra,ecc,thrust_time) % uses function to determine mean anomaly
propagator3_stopcond.Properties.RepeatCount = 1;
propagator3.StoppingConditions.Remove('Duration');          
%propagator3_stopcond.Properties.Criterion='eVACriterionCrossEither'; 
skip_value = 2;
x=skip_value;
%%
disp('Enter for-loop')
for i=1:5000
    
    disp(['--- Iteration: ', num2str(i),' ---'])


    
    
    if(i==x)
        driver.MainSequence.Remove("ManeuverClimbV1");
        % 
        driver.RunMCS
        % driver.MainSequence.Remove("Propage 1");
        % %

    else
        driver.RunMCS
        disp("Fire")
    end
    
    if(i==1)
    driver.MainSequence.Remove("First_propagator_peri");
    end

    %driver.RunMCS;  % IAgVADriverMCS driver: MCS driver interface

    Epoch_new{i} = propagator3.GetResultValue('Epoch');             % get date from the last step
    initState1.OrbitEpoch = Epoch_new{i};                           % geschwungene klammer sintax für cell array

    ra_new(i) = propagator3.GetResultValue('Altitude_Of_Apoapsis'); % get altitude of the apoapsis from the last step;
    kep.ApoapsisAltitudeSize = ra_new(i);

    rp_new(i) = propagator3.GetResultValue('Altitude_Of_Periapsis');

    Incl_new(i) = propagator3.GetResultValue('Inclination');
    kep.Inclination = Incl_new(i);

    RAAN_new(i) = propagator3.GetResultValue('RAAN');
    kep.RAAN = RAAN_new(i);

    ecc_new(i) = propagator3.GetResultValue('Eccentricity');        % get the value of the eccentritiy from the last step
    kep.Eccentricity = ecc_new(i);                                  % update the value

    ArgPeri_new(i) = propagator3.GetResultValue('Argument of Periapsis');
    kep.ArgOfPeriapsis = ArgPeri_new(i);

    TrueAno_new(i) = propagator3.GetResultValue('True_Anomaly');
    kep.TrueAnomaly = TrueAno_new(i);                               % value of Propagator END; stays const.

    % Propagator
    % propagator3_stopcond.Properties.Trip = MeanAno_thrusttime_fcn(ra_new(i),ecc_new(i),thrust_time);
    
    if(i==x)
    driver.MainSequence.Remove("Propage 1");
        %

    
    in_manu = driver.MainSequence.InsertByName('ManeuverClimbV1','-'); % Maneuver from component browser
    in_manu.Maneuver.SetPropulsionMethod('eVAPropulsionMethodEngineModel', 'Enpulsion 2'); % select engine fromm browser
    prop_manu = in_manu.Maneuver.Propagator;
    trip = prop_manu.StoppingConditions.Add('Duration');
    trip.Properties.Trip = thrust_time;                 % Trip count in - [Sec]
    prop_manu.StoppingConditions.Remove('Duration');
    % 
    propagator3 = driver.MainSequence.Insert('eVASegmentTypePropagate','Propage_1','-');
    propagator3.PropagatorName = 'Earth HPOP Default v10';
    propagator3.Properties.Color = 255; % red
    propagator3_stopcond = propagator3.StoppingConditions.Add('Periapsis');
    %propagator3_stopcond.Properties.Trip = 340.8281;   % 340.82809637266905 for thrust_time = 600 sec -> average between apo=500 and 1000
    %propagator3_stopcond.Properties.Trip = MeanAno_thursttime_fcn(ra,ecc,thrust_time) % uses function to determine mean anomaly
    propagator3_stopcond.Properties.RepeatCount = 1;
    propagator3.StoppingConditions.Remove('Duration');

    x=x+skip_value;
    disp(["Skip ",num2str(x)])
    end


   
    %disp(datetime(Epoch_new(i),'InputFormat','dd MMM uuuu HH:mm:ss.SSS'))
    disp(['Apogee = ', num2str(ra_new(i))])
    if ra_new(i) > 1000
        break
    end
end

%%
epoch_datetime = datetime(Epoch_new,'InputFormat','dd MMM uuuu HH:mm:ss.SSS');
years = daysact(epoch_datetime(1),epoch_datetime(end))/365;
years_pl = linspace(0,years,length(ra_new));
%%
%x=1:i;
figure(2)
hold on 
plot(years_pl,ra_new)
plot(years_pl,rp_new)
xlabel('Time in years')
ylabel('Altitude in km')
legend('Apogee','Perigee')
title('Thrust time 10 min, Thrust = 0.350 mN, Isp = 1900 s, mass = 4.5 kg, drag coefficient = 2.2, drag area = 0.08 m², inclination = 97.4°')
grid minor


%% Functions

function M = MeanAno_thursttime_fcn(ra,e,dt2)
    % This function determines the mean anomaly at which the s/c is dt2/2 (dt2 = thrust duration)
    % before perigee (Theory see Orbital Mechanics for Engineering Students, Third Edition, Howard D. Curtis)
    
    % dt2 = 600;
    % ra = 500;
    % e = 0.001;
     
    re = 6378;          % earth radius
    ra_e = ra+re;
    rp_e = ra_e*(1-e)/(e+1);
    
    dt2 = dt2/2;        % Thrsut duration / 2
    muh = 398600;       % Gravitaional parameter earth
    
    a = (rp_e+ra_e)/2;                  % Semi major axis
    T = (2*pi/sqrt(muh))*a^(3/2);       % Period
    M1 = 2*pi*dt2/T;                    % Mean anomaly (p.148, eq.3.8)
    E = M1+e*sin(M1)+e^2/2*sin(2)*M1;   % Eccentricic anomaly (p.159, eq.3.21)
    theta1 = acos((e-cos(E))/(e*cos(E)-1))*180/pi;
    theta = 360-theta1;                 % True anomaly dt2/2 before perigee
    M = 360-M1*180/pi;                  % Mean anomaly dt2/2 before perigee

end