import pandas as pd
from datetime import datetime,timedelta
import numpy as np
import openpyxl

#parameters
firing_duration = 600#seconds
time_step = 60 #seconds *** ideally, choose the timestep so that (total_scenario_time/time_step) is an integer ***

### Reading external files ###
CSV_scenario_time = CSV_fire = pd.read_csv('C:\\CLIMB Operation\\Scenario_time.csv')
CSV_fire = pd.read_csv('C:\\CLIMB Operation\\Fire_schedule.csv')
CSV_access = pd.read_csv('C:\\CLIMB Operation\\Access_schedule.csv')
CSV_PowerGenerated = pd.read_csv('C:\\CLIMB Operation\\CLIMB_Solar_Panel_Power.csv')
CSV_RPM_TorqueTool = pd.read_csv('C:\\CLIMB Operation\\RPM_overTime.csv')
#CSV_RPM_formatted = pd.read_csv('C:\\CLIMB Operation\\RPM_grafana_format.csv')
workbook = openpyxl.load_workbook('C:\\CLIMB Operation\\CLIMB Power Budget V2.xlsx', data_only=True)
sheet_power = workbook['Power Budget CLIMB']

workbook = openpyxl.load_workbook('C:\\CLIMB Operation\\Battery_InitialStatus_Model_Parameters.xlsx', data_only=True)
sheet_battery = workbook['Sheet1']

CSV_powerTool = open('C:\\CLIMB Operation\\PowerTool.csv', "w").close() #cleaning up CSV file before new 72h propagation
CSV_powerTool = open('C:\\CLIMB Operation\\PowerTool.csv', "a")
CSV_powerTool.write("Timestamp, Propulsion mode power consumption, Downlink mode power consumption, Total Power Consumed, Power Generated, Battery Power Output, Battery Capacity, SOC") #re-writing headers
CSV_powerTool.close()

### Torque tool code ### used to convert date format from STK output to suitable input for Grafana
RPM_timestamp = CSV_RPM_TorqueTool.at[0,'Time (UTCG)']
RPM_timestamp_object = datetime.strptime(RPM_timestamp, "%d-%b-%Y %H:%M:%S")
RPM_timestamp_grafana_format = RPM_timestamp_object.strftime("%d-%m-%Y %H:%M:%S")
print(RPM_timestamp_grafana_format)
CSV_RPM_Formatted = open('C:\\CLIMB Operation\\RPM_grafana_format.csv', "w").close()
CSV_RPM_Formatted = open('C:\\CLIMB Operation\\RPM_grafana_format.csv', "a")
CSV_RPM_Formatted.write("Timestamp, RPM_x, RPM_y, RPM_z")
CSV_RPM_length = len(CSV_RPM_TorqueTool['Time (UTCG)'])-1


for r in range(0,CSV_RPM_length):

    RPM_timestamp = CSV_RPM_TorqueTool.at[r, 'Time (UTCG)']
    RPM_timestamp_object = datetime.strptime(RPM_timestamp, "%d-%b-%Y %H:%M:%S")
    RPM_timestamp_grafana_format = RPM_timestamp_object.strftime("%d-%m-%Y %H:%M:%S")

    RPM_x = CSV_RPM_TorqueTool.at[r, 'RPM in X']
    RPM_y = CSV_RPM_TorqueTool.at[r, 'RPM in Y']
    RPM_z = CSV_RPM_TorqueTool.at[r, 'RPM in Z']

    CSV_RPM_Formatted.write("\n%s, %0.2f, %0.2f, %0.2f" % (RPM_timestamp_grafana_format, RPM_x, RPM_y, RPM_z))

#reading power consumptions from different modes from Power budget table
propulsion_mode_consumption = sheet_power['AL35'].value #[W]
downlink_mode_consumption = sheet_power['AB35'].value #[W]
background_power = sheet_power['AG35'].value #[W]

#power_generated_solar_arrays = sheet['H36'].value #[W]
#power_available_from_battery = propulsion_mode_consumption-power_generated_solar_arrays
#total_power_available_value = power_available_from_battery+ power_generated_solar_arrays
safeModeFalse = 1
recoveryModeFalse = 1

scenario_start_timestamp = CSV_scenario_time.at[0, 'Scenario start time']
scenario_stop_timestamp = CSV_scenario_time.at[0, 'Scenario stop time']


#string parsing into formatted datetime object

scenario_start_timestamp_object = datetime.strptime(scenario_start_timestamp, "%d-%b-%Y %H:%M:%S")
scenario_stop_timestamp_object = datetime.strptime(scenario_stop_timestamp, "%d-%b-%Y %H:%M:%S")
total_scenario_time = (scenario_stop_timestamp_object-scenario_start_timestamp_object).total_seconds()

scenario_start_timestamp_grafana_format = scenario_start_timestamp_object.strftime("%d-%m-%Y %H:%M:%S")
scenario_start_timestamp_grafana_format_object = datetime.strptime(scenario_start_timestamp_grafana_format, "%d-%m-%Y %H:%M:%S")




### firing times and windows ###
firing_column_length = len(CSV_fire['Perigee pass time'])

perigee_timestamps_raw = [0]*firing_column_length
perigee_timestamps = [0]*firing_column_length
perigee_timestamps_object = [0]*firing_column_length
perigee_times = [0]*firing_column_length
perigee_times_in_seconds = [0]*firing_column_length
firing_window_opens = [0]*firing_column_length
firing_window_closes = [0]*firing_column_length
firing_window_used = [0]*firing_column_length



for i in range(1,firing_column_length):
    perigee_timestamps_raw[i] = CSV_fire.at[i, 'Perigee pass time']
    # Truncate the epSeq
    perigee_timestamps[i] = perigee_timestamps_raw[i]
    perigee_timestamps_object[i] = datetime.strptime(perigee_timestamps[i], "%d-%b-%Y %H:%M:%S")
    perigee_times[i] = perigee_timestamps_object[i] - scenario_start_timestamp_object
    perigee_times_in_seconds[i] = perigee_times[i].total_seconds()
    firing_window_opens[i] = perigee_times_in_seconds[i] - firing_duration/2
    firing_window_closes[i] = perigee_times_in_seconds[i] + firing_duration/2
    firing_window_used[i] = CSV_fire.at[i, 'Propulsion On/ Off']

### Access windows ###
access_column_length = len(CSV_access['Access window start'])


access_window_opens_raw = [0]*access_column_length
access_window_opens = [0]*access_column_length
access_window_opens_object = [0]*access_column_length
access_window_closes_raw = [0]*access_column_length
access_window_closes = [0]*access_column_length
access_window_closes_object = [0]*access_column_length
access_window_used = [0]*access_column_length
access_window_opens_times = [0]*access_column_length
access_window_closes_times = [0]*access_column_length
access_window_opens_times_in_seconds = [0]*access_column_length
access_window_closes_times_in_seconds = [0]*access_column_length

for l in range(0,access_column_length):
    access_window_opens_raw[l] = CSV_access.at[l, 'Access window start']
    access_window_opens[l] = access_window_opens_raw[l]
    access_window_closes_raw[l] = CSV_access.at[l, 'Access window end']
    access_window_closes[l] = access_window_closes_raw[l]
    access_window_opens_object[l] = datetime.strptime(access_window_opens[l], "%d %b %Y %H:%M:%S")
    access_window_closes_object[l] = datetime.strptime(access_window_closes[l], "%d %b %Y %H:%M:%S")

    access_window_opens_times[l] = access_window_opens_object[l] - scenario_start_timestamp_object
    access_window_closes_times[l] = access_window_closes_object[l] - scenario_start_timestamp_object
    access_window_opens_times_in_seconds[l] = access_window_opens_times[l].total_seconds()
    access_window_closes_times_in_seconds[l] = access_window_closes_times[l].total_seconds()

    access_window_used[l] = CSV_access.at[l, 'Access Status']


### Solar array power generated windows ###
power_gen_column_length = len(CSV_PowerGenerated['Time (UTCG)'])

power_gen_timestamps = [0]*power_gen_column_length
power_gen_timestamps_object = [0]*power_gen_column_length
power_gen_timestamps_in_seconds = [0]*power_gen_column_length

for m in range(0, power_gen_column_length):
    power_gen_timestamps[m] = CSV_PowerGenerated.at[m, 'Time (UTCG)'][:-10]
    power_gen_timestamps_object[m] = datetime.strptime(power_gen_timestamps[m], "%d %b %Y %H:%M:%S")
    power_gen_timestamps_in_seconds[m] = (power_gen_timestamps_object[m]-scenario_start_timestamp_object).total_seconds()


### Battery model
initial_Bat_voltage = sheet_battery['B2'].value #[V] #measured from telemetry
nominal_capacity = 8 #[Ah] #each cell has a maximum capacity of 2000 mAh, parallel connection

#lifetime model (total battery capacity as a function of number of cycles)
N_cycles = sheet_battery['B3'].value #measured from telemetry/calculations
degradation_ratio = sheet_battery['B10'].value #[1/cycle] # extrapolated from battery datasheet chart

total_capacity = nominal_capacity* (1-degradation_ratio*N_cycles)

#I should use a different model if charghing!!!
#discharge model parameters for 2S battery pack(linear model) extrapolated from battery datasheet chart
V_0= sheet_battery['B6'].value #V_0 for 2S
m =sheet_battery['B7'].value # slope 2S
initial_discharge_capacity = ((initial_Bat_voltage-V_0)/m)
initial_capacity = total_capacity - initial_discharge_capacity #at the beginning of the scenario
initial_SOC = (initial_capacity/total_capacity) * 100 #[%]


print("total capacity = %0.02f Ah" % total_capacity)
print("initial capacity = %0.02f Ah" % initial_capacity)
print("initial SOC = %0.02f percent" % initial_SOC)

##---> obtain using chart/model the capacity from initial voltage
##--->obtain using cycles and current capacity the current SOC



current_12Vrail_propulsion = sheet_power['AL34'].value/12
current_7V4rail_propulsion = sheet_power['AM34'].value/7.4
current_3V3rail_propulsion = sheet_power['AN34'].value/3.3
current_5Vrail_propulsion = sheet_power['AO34'].value/5
propulsion_totalCurrent =current_12Vrail_propulsion+current_7V4rail_propulsion+current_3V3rail_propulsion+current_5Vrail_propulsion

propulsion_discharge = propulsion_totalCurrent*(time_step/3600) #[Ah] discharge due to propulsion mode over a time-step

current_12Vrail_cruise = sheet_power['AG34'].value/12
current_7V4rail_cruise = sheet_power['AH34'].value/7.4
current_3V3rail_cruise = sheet_power['AI34'].value/3.3
current_5Vrail_cruise = sheet_power['AJ34'].value/5
cruise_totalCurrent =current_12Vrail_cruise+current_7V4rail_cruise+current_3V3rail_cruise+current_5Vrail_cruise

background_discharge = cruise_totalCurrent*(time_step/3600) #as a function of mode! (e.g. cruise, science)  ###POWER MODES IMPL

current_12Vrail_downlink = sheet_power['AB34'].value/12
current_7V4rail_downlink = sheet_power['AC34'].value/7.4
current_3V3rail_downlink = sheet_power['AD34'].value/3.3
current_5Vrail_downlink = sheet_power['AE34'].value/5
downlink_totalCurrent =current_12Vrail_downlink+current_7V4rail_downlink+current_3V3rail_downlink+current_5Vrail_downlink

downlink_discharge = downlink_totalCurrent*(time_step/3600) #[Ah] discharge due to downlink mode over a time-step



#charging parameters
N_cells = 2
charging_voltage = 3.65 * N_cells #according to datasheet




### Evaluation of "instantaneous" power and battery capacity available on a time-step basis (see parameters at the beginning of script)

time_array_length = int(total_scenario_time/time_step)
time_array = [0]*time_array_length
propulsion_power = [0]*time_array_length
thruster_on = [0]*time_array_length
downlink_power = [0]*time_array_length
total_power_consumed = [0]*time_array_length
total_power_available = [0]*time_array_length
grafana_format_timestamps = [0]*time_array_length
grafana_format_timestamps[0] = scenario_start_timestamp_grafana_format = scenario_start_timestamp_object.strftime("%d-%m-%Y %H:%M:%S")
power_generated = [0]*time_array_length
power_from_battery = [0]*time_array_length
bat_capacity = [0]*time_array_length
bat_capacity[0] = initial_capacity
charging_capacity = [0]*time_array_length
bat_SOC = [0]*time_array_length
downlink_on = [0]*time_array_length
j=0 #perigee counter or firing window counter
a=0 #access window counter
n=0 #power generation "window" counter

for k in range(1,time_array_length):
    total_power_consumed[k] = background_power
    firing_opportunity = 0
    time_array[k] = time_array[k-1]+time_step
    current_time = time_array[k]
    delta = timedelta(seconds=k*time_step)

    grafana_format_object_with_delta =scenario_start_timestamp_grafana_format_object+delta
    #grafana_format_timestamps[k] = grafana_format_object_with_delta.strftime("%Y-%m-%d %H:%M:%S")
    grafana_format_timestamps[k] = grafana_format_object_with_delta.strftime("%d-%m-%Y %H:%M:%S")
    ### firing windows ###
    if current_time>firing_window_opens[j] and current_time<firing_window_closes[j]:
        #firing_opportunity = 1
        propulsion_power[k] = propulsion_mode_consumption*firing_window_used[j]*safeModeFalse*recoveryModeFalse
        if firing_window_used[j]==1:
            total_power_consumed[k] = propulsion_power[k]
            thruster_on[k] = 1

    if current_time>firing_window_closes[j] and j<len(firing_window_closes)-1:
        j = j+1

    ### access windows ###
    if current_time>access_window_opens_times_in_seconds[a] and current_time<access_window_closes_times_in_seconds[a]:

        downlink_power[k] = downlink_mode_consumption*access_window_used[a]
        if access_window_used[a] ==1:
            total_power_consumed[k] = downlink_power[k]
            downlink_on[k]=1
       # print("a=%d; S-band Comm opportunity at time %0.02f, S-band tx on = %d"%(a,time_array[k],S_band_tx_on))

    if current_time>access_window_closes_times_in_seconds[a] and a<len(access_window_closes_times_in_seconds)-1:
        a = a+1 #window counter increases

    ### power generation ###
    if current_time>=power_gen_timestamps_in_seconds[n] and current_time<=power_gen_timestamps_in_seconds[n+1]:
        power_generated[k] = CSV_PowerGenerated.at[n, 'Power (W)']

    if current_time >= power_gen_timestamps_in_seconds[n+1] and n < len(power_gen_timestamps_in_seconds):
        n = n+1

    power_from_battery[k] = total_power_consumed[k] - power_generated[k]

    charging_capacity[k] = (power_generated[k]/charging_voltage)*(time_step/3600)

    bat_capacity[k] = bat_capacity[k-1] - background_discharge - thruster_on[k]*(propulsion_discharge-background_discharge) - downlink_on[k]*(downlink_discharge-background_discharge) + charging_capacity[k]

    if bat_capacity[k] > total_capacity:
        bat_capacity[k] = total_capacity

    bat_SOC[k] = (bat_capacity[k]/total_capacity)*100


    CSV_powerTool = open('C:\\CLIMB Operation\\PowerTool.csv', "a")
    CSV_powerTool.write("\n%s, %0.4f, %0.4f, %0.4f, %0.4f, %0.4f, %0.4f, %0.2f"%(grafana_format_timestamps[k], propulsion_power[k], downlink_power[k], total_power_consumed[k], power_generated[k], power_from_battery[k], bat_capacity[k], bat_SOC[k])) ####note that k starts from 1! so i'm skipping the first time-step
    CSV_powerTool.close()

