clc
close all
clear all
%% Constants

Torque_tool_data  = readtable('C:CLIMB Operation\Torque_tool_data.xlsx');

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
% T_cm_x=cm_x*F; % Torque, Nm
% T_cm_y=cm_y*F; % Torque, Nm
% L_cm_x=T_cm_x*t_thrust;
% L_cm_y=T_cm_x*t_thrust;

%% Input reading

% YPR 
    Angular_velo_data=readtable("C:CLIMB Operation\YPR.csv",'HeaderLines', 1);
    Velo_time=Angular_velo_data(:,1);
    Velo_time=table2cell(Velo_time);
    Velo_time=datetime(Velo_time, 'InputFormat', 'd MMM yyyy HH:mm:ss');
    Yaw=table2array(Angular_velo_data(:,2));
    Pitch=table2array(Angular_velo_data(:,3));
    Roll=table2array(Angular_velo_data(:,4));
    % Yaw_rate=table2array(Angular_velo_data(:,5));
    % Pitch_rate=table2array(Angular_velo_data(:,6));
    % Roll_rate=table2array(Angular_velo_data(:,7));

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

% Fire schedule
    Fire_data=readtable("C:CLIMB Operation\Fire_schedule.csv",'HeaderLines', 1);
    Fire_times = table2array(Fire_data(:,1));
    Fire_status = table2array(Fire_data(:,2));
        Burn_time_status = zeros((size(Velo_time,1))-1,1); %  delta_L_x=zeros(size(L_x, 1), 1);
        
        for i = 1:size(Fire_times)
            if Fire_status(1) == 1
                break;
            end
            for j = 1:size(Burn_time_status)
                if abs(seconds(Velo_time(j) - Fire_times(i))) < 300 && Fire_status(i) == 1
                    Burn_time_status(j) = 1;
                end
            
            end
        
        end

% Torque
    Torque_data= readtable("C:CLIMB Operation\Torque.csv", 'HeaderLines', 1);
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
    L_data= readtable("C:CLIMB Operation\AngularMomentum.csv", 'HeaderLines', 1);
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

    Angular_momentum_yaw = (Angular_momentum_yaw_STK) ; % Nms
    Angular_momentum_pitch= (Angular_momentum_pitch_STK) + Thrust_momentum_pitch+Angular_momentum_misall_PR; 
    Angular_momentum_roll= (Angular_momentum_roll_STK) +Thrust_momentum_roll;
    
%% RPM of the wheel
    RPM_x = Angular_momentum_roll/I_fw*30/pi+RPM_wheel_initial; 
    RPM_y = Angular_momentum_pitch/I_fw*30/pi+RPM_wheel_initial;
    RPM_z = Angular_momentum_yaw/I_fw*30/pi+RPM_wheel_initial;


%     time_L_limit = min(time_L_limit_x, time_L_limit_y, time_L_limit_z, 'omitnan');
%     time_unil_desaturation=days(duration((time_L_limit-min(L_time))));
%     disp(['saturation occurs on: ', datestr(time_L_limit)]);
%     disp(['max days without desaturation: ', num2str(time_unil_desaturation)]);
% 
%     delta_RPM_wheel=-delta_L_x/I_fw*(30/pi);
%     RPM_wheel=cumsum(delta_RPM_wheel);
%     RPM_wheel(1,1)=RPM_wheel_initial+RPM_wheel(1,1);

%     time_RPM_limit=max( L_time(abs(RPM_wheel) <= RPM_limit));
%     time_unil_desaturation_maxRPM=days(duration((time_RPM_limit-min(L_time))));
%     disp(['saturation occurs on (due to RPM): ', datestr(time_RPM_limit)]);
%     disp(['max days without desaturation (due to RPM): ', num2str(time_unil_desaturation_maxRPM)]);
   %% Plots
%     figure Name YPR
%         hold on
%         plot(Velo_time,Yaw,  'Color', 'green')
%         plot(Velo_time,Pitch, 'Color', 'black')
%         plot(Velo_time,Roll,  'Color', 'red')
%         xlabel('Time') 
%         ylabel('YPR (deg)')
%         legend({'yaw','pitch','roll', ...
%             },'Location','southeast')
%         hold off 

  

    figure Name STK_L
        hold on
        plot(Velo_time(1:length(Yaw_rate)),Angular_momentum_yaw_STK,  'Color', 'green')
        plot(Velo_time(1:length(Yaw_rate)),Angular_momentum_pitch_STK, 'Color', 'black')
        plot(Velo_time(1:length(Yaw_rate)),Angular_momentum_roll_STK,  'Color', 'red')
        xlabel('Time') 
        ylabel('Angular momentum (Nms)')
        legend({'Angular momentum in yaw','Angular momentum in pitch','Angular momentum in roll', ...
            },'Location','southeast')
        hold off


     figure Name VectorMis_L
            hold on
            plot(Velo_time(1:length(Yaw_rate)),Angular_momentum_misall_PR, 'Color', 'black')
            
            xlabel('Time') 
            ylabel('Angular momentum (Nms)')
            legend({'Angular momentum due to thrust vector misalignment', ...
                },'Location','southeast')
            hold off

      figure Name Total_L
            hold on
            plot(Velo_time(1:length(Yaw_rate)),Angular_momentum_yaw,  'Color', 'green')
            plot(Velo_time(1:length(Yaw_rate)),Angular_momentum_pitch, 'Color', 'black')
            plot(Velo_time(1:length(Yaw_rate)),Angular_momentum_roll,  'Color', 'red')
            xlabel('Time') 
            ylabel('Angular momentum (Nms)')
            legend({'Angular momentum in yaw','Angular momentum in pitch','Angular momentum in roll', ...
                },'Location','southeast')
            hold off

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

%       figure Name temp
%         hold on
%         plot(Velo_time(1:length(Yaw_rate)),Thrust_momentum_roll, 'Color', 'black')
%         plot(Velo_time(1:length(Yaw_rate)),Thrust_momentum_pitch,'Color', 'green')
%         hold off
% 
%          figure Name L_STK_last
%             hold on
%             plot(Velo_time(1:length(L_z)),L_z,  'Color', 'green')
%             plot(Velo_time(1:length(L_z)),L_y, 'Color', 'black')
%             plot(Velo_time(1:length(L_z)),L_x,  'Color', 'red')
%             xlabel('Time') 
%             ylabel('Angular momentum (Nms)')
%             legend({'Angular momentum in yaw','Angular momentum in pitch','Angular momentum in roll', ...
%                 },'Location','southeast')
%             hold off

    %% RPM over time output for GRAFANA
    Velo_time=cellstr(Velo_time(1:size(RPM_x)));
    RPM_over_time=[Velo_time,num2cell(RPM_x),num2cell(RPM_y),num2cell(RPM_z)];
    RPM_over_time=array2table(RPM_over_time);
    RPM_over_time.Properties.VariableNames(1:4) = {'Time (UTCG)','RPM in X','RPM in Y','RPM in Z'};
    writetable(RPM_over_time,'C:CLIMB Operation\RPM_overTime.csv');


  