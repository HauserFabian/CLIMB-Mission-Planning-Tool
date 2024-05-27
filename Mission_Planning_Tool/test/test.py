from datetime import datetime,timedelta

scenario_start_timestamp_object = datetime.strptime('06-May-2024 20:15:04', '%d-%b-%Y %H:%M:%S')
scenario_start_timestamp_grafana_format = scenario_start_timestamp_object.strftime("%d-%m-%Y %H:%M:%S")
scenario_start_timestamp_grafana_format_object = datetime.strptime(scenario_start_timestamp_grafana_format, "%d-%m-%Y %H:%M:%S")