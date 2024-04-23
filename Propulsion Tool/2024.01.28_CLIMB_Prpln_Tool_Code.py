# -*- coding: utf-8 -*-
"""
Created on Fri Nov 10 00:16:32 2023

@author: Giacomos, Hans
"""

#calling libraries (extra tools) in Python
import datetime    
import time   
import random as rnd
import numpy as np
import pandas as pd  




# Defining Received Values/Data ##############################################
#in lieu of actual data, a 0-50% variation to the nominal values are randomly
#created. this section of the code must be deleted if actual data file is
#received from the thruster via the ground station team.

# Get the current date and time
DT= pd.date_range(start="2024/01/11",periods=3600,freq="S")
#period in DT is seconds, thus 1 hour of data is generated as 
#the thruster operated 10 minutes between 30 & 40 minute mark.

# Format the datetime object as a string
fmDT = DT.strftime("%Y-%m-%d %H:%M:%S")


#converting variable type to pandas DataFrame
df= pd.DataFrame(fmDT,columns=["Date & Time"])

#getting the length (size) of df
dfsize= df.size
#creating array of zeroes & ones based on dfsize
emptyOnes= np.ones(dfsize)
emptyZeroes= np.zeros(dfsize)
#generating {gaussian} distribution centered at 0 with std dvi of 0.1
var1= np.random.normal(0, 0.15, dfsize) #large variation
#generating {uniform} random values between -0.05 and 0.05, i.e 5% noise
var2= np.random.uniform(-0.05, 0.05, dfsize) #small variation

#converting list to np.array type and transpose to align them in columns
empty=np.array([emptyZeroes, emptyOnes, var1, var2]).T
label=["Zeroes", "Ones", "Gaussian", "Uniform"]
ref= pd.DataFrame(empty,columns=label)



#Defining Nominal Values based on Receved Spec. Sheet ########################
#Reset Cycle Counter (LSB), read only
#: after each power/reset cycle the non-volatile counter is incremented.
#: LSB stands for Least Significant Byte
RCC= emptyZeroes
df.insert(1,"RCC",RCC)
df.loc[ref["Uniform"]> 0.04, "RCC"]= 1

#Fuse Status (LSB), read&write
#: 0 to 0x1F, shows which fuses have been triggered. Writing 0 to all 4 bytes
#resets. default value (df) is zero
FS= emptyZeroes
df.insert(2,"FS",FS)

#Operationial Mode, read&write
#: 0=disabled (df), 1=enabled reservoir heats up,
#2=enabled reservoir heats up, returns to opertional mode 1. 
OpMode= emptyZeroes
df.insert(3,"Op Mode",OpMode)
df.loc[1800:2400, "Op Mode"]= 1 #could replace with "OpMode[1800:2400]= 1"

#Status, read only
#: 0=idle (df), 1=heating reservoir, 2=standby, 3=operation(thrust on)
Status= emptyZeroes
df.insert(4,"Status", Status)
df.loc[1800:2400, "Status"]= 3

#Thrust (LSB), read only
#: 0~1 [mN]
Thrust= emptyZeroes
Thrust[1800:2400]= 1- abs(var2[0:600])
df.insert(5,"Thrust", Thrust)


#Specific Impulse (LSB), read only
#: 1000~7000 [s]
Isp= emptyZeroes
Isp[1800:2400]= 7000*(1- abs(var2[0:600]) )
df.insert(6,"Isp", Isp)
#df.loc[1800:2400,"Isp"]= 1- abs(ref["Uniform"][0:599])

#Bus Voltage (LSB), read only
#: nominal vss= 1 [mV]
Bus_V= emptyOnes* (12+ var1)
df.insert(7,"Bus_V", Bus_V)

#Bus Current (LSB), read only
#: 1~5 [A]
Bus_I= emptyOnes* (4.8 + var2) #var2 so uniform random
df.insert(8,"Bus_I", Bus_I)


#Emitter Voltage (LSB), read only
#: 0~10 [kV], 0 is default value (df)
Emit_V= emptyZeroes
Emit_V[1800:2400]= 10*(1- abs(var2[601:1201]) )
df.insert(9, "Emit_V", Emit_V)

#Emitter Current (LSB), read only
#: 0~4 [mA], 0 is df
Emit_I= emptyZeroes
Emit_I[1800:2400]= 4*(1- abs(var1[601:1201]) )
df.insert(10, "Emit_I", Emit_I)
 
#Emitter Power (MSB), read only
#: 0~30 [W], 0 is df
Emit_P= df.loc[:,"Emit_V"]* df.loc[:,"Emit_I"]
df.insert(11, "Emit_P", Emit_P)


#Extractor Voltage (LSB), read only
#: 0~10 [kV]
Ext_V= emptyZeroes
Ext_V[1800:2400]= 10*(1- abs(var2[1202:1802]) )
df.insert(12, "Ext_V", Ext_V)

#Extractor Current (LSB), read only
#: 0~450 [uA]
Ext_I= emptyZeroes
Ext_I[1800:2400]= 450*(1- abs(var1[1202:1802]) )
df.insert(13, "Ext_I", Ext_I)

#Extractor Power (MSB), read only
#: 0~5 [W]
Ext_P= df.loc[:,"Ext_V"]* (df.loc[:,"Ext_I"]/1000)
df.insert(14, "Ext_P", Ext_P)


#Reservoir Heat Power (LSB), readonly
#: 0~10.0 [W]
Rsv_P= emptyZeroes
Rsv_P[1800:2400]= 10*(1- abs(var2[1803:2403]) )
df.insert(15, "Rsv_P", Rsv_P)

#Reservoir Temperature, read only
#: 0~573 [K] or 299.85 Celsius, 293 +-20 [K] is default value (df)
Rsv_T= emptyOnes* (293+ (var1))
Rsv_T[1800:2400]= 333*(1- abs(var2[1803:2403]) )
df.insert(16, "Rsv_T", Rsv_T)


#Neutralizer Bias, read only
#: 0=disabled, 1=enabled
Neut= emptyZeroes
df.insert(17,"Neut Bias",Neut)

#Neutralizer Bias Voltage, read only
#: 0~330 [V]
Neut_V= emptyZeroes
Neut_V[1800:2400]= 330*(1- abs(var2[2404:3004]) )
df.insert(18, "Neut_V", Neut_V)

#Neutralizer Beam Current (LSB), read only
#: 0~6.5 [mA]
NeutB_I= emptyZeroes
NeutB_I[1800:2400]= 6.5*(1- abs(var1[2404:3004]) )
df.insert(19, "NeutB_I", NeutB_I)

#Neutralizer Power (MSB), read only
#: 0~2.145 [W]
NeutB_P= df.loc[:,"Neut_V"]* (df.loc[:,"NeutB_I"]/1000)
df.insert(20, "NeutB_P", NeutB_P)


#LV Board Temperature, read only
#: 0~573 [K] or 299.85 Celsius, 293 +-20 [K] is df
LVB_T= emptyOnes* (293+ (var2))
LVB_T[1800:2400]= 321*(1- abs(var2[3000:3600]) )
df.insert(21, "LVB_T", LVB_T)

#Thermoelectric Voltage (LSB), read only
#: 0~24.75 [mV]
Trmelc_V= emptyOnes* (24.75- abs(var1))
df.insert(22, "ThermoEle_V", Trmelc_V)

#Extended Fuse Status, read&write
#: 0 to 0x1F, shows which fuses have been triggered. Writing 0 to 
#all 4 bytes resets. Default value (df) is zero
FSe= emptyZeroes
df.insert(23,"FSe",FSe)


# rounding values to 3 decimal places
df = df.round(decimals = 3)
# Saving the created random dataframe to a CSV file ###########################
df.to_csv("Received Data/examplary_CLIMB_random_telemetry.csv")

#this concludes data generating. Once a real data is received, all the code
#above this line must be ignored or deleted.



# Data/File Importing ########################################################

#importing/reading the received data from the Ground Station
rawData= pd.read_csv("Received Data/examplary_CLIMB_random_telemetry.csv")
#the file name and its path must be changed for the real data

#printing first row or the column label/name
print(rawData.columns)
print("\n")

#printing the size of the received data
print (rawData.shape)

"""
#activate the following lines (except the comment) if data file is a tab seperated file.
#adding the delimiter in order to recognize the tab seperation
rawData= pd.read_csv("Received Data/examplary_CLIMB_random_telemetry.csv",\
                delimiter="\t")
print(rawData.head)
print("\n")
"""



# Data Selecting & Recording #################################################

#creating a empty list; it's a place holder
"""
ph= list()

#assigning(copy) wanted columns to the place holder list
#column number is recorded in a list called "cn." 
#it contains the column number or INDEXs of wanted data
#cn= [1,31,44,28,29,18,37,39,43,39,8,11,15,16,25,16,24,5,6]
cn= [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
for i in cn:
    ph.append( rawData.iloc[:,i] )
"""
 


# Data Calcualtion #################################################

# Bus Power calculation
Bus_P= rawData.iloc[:,8] * rawData.iloc[:,9]
rawData.loc[:,"Bus_P"]= Bus_P
# Fuel Flow calculation
m_dot= ( rawData.iloc[:,6]/ (rawData.iloc[:,7]* 0.908665) )*10**3 #[mg/s]
rawData.loc[:,"m_dot"]= m_dot

#Index searching & recording when the thrust was on
idx=[]
idx= df[df['Thrust']>0].index.tolist()

#Pre declanation to store the Average and Last Values
#These will be displayed on Grafana
md=0  # short for mass flow= m dot
thr=0 # short for thrust
isp=0 
emtv=0 # emiter voltage
emti=0 # emiter current
emtp=0 # emiter power
extv=0 # extractor voltage
exti=0 # extractor current
extp=0 # extractor power
neuv=0 # neutralizer voltage
neui=0 # neutralizer current
neup=0 # Neutralizer power
rsvp=0 # Reservoir heat power

#look to sum all the values when the thrust was on
for i in idx:
    thr= thr+ rawData.iloc[i,6]
    isp= isp+ rawData.iloc[i,7]
    
    emtv= emtv+ rawData.iloc[i,10]
    emti= emti+ rawData.iloc[i,11]
    emtp= emtp+ rawData.iloc[i,12]
    
    extv= extv+ rawData.iloc[i,13]
    exti= exti+ rawData.iloc[i,14]
    extp= extp+ rawData.iloc[i,15]
    
    neuv= neuv+ rawData.iloc[i,19]
    neui= neui+ rawData.iloc[i,20]
    neup= neup+ rawData.iloc[i,21]
    
    rsvp= rsvp+ rawData.iloc[i,16]
    
    md= md+ m_dot[i]
    

#total nubmer/length of the index list
ilen=  len(idx) # ilen= index length
#last index number in idx
lv= idx[-1] #lv= last value (before thruster was turned off)

#calculating average and last value
#the average value is stored at row number 0
#the last value is stored at the last row. 
rawData.loc[0,"thr"]= thr/ilen
rawData.iloc[-1,-1]= rawData.iloc[lv,6]

rawData.loc[0,"isp"]= isp/ilen
rawData.iloc[-1,-1]= rawData.iloc[lv,7]

rawData.loc[0,"emtv"]= emtv/ilen  #avg value in 1st cell
rawData.iloc[-1,-1]= rawData.iloc[lv,10] #last value in last cell
rawData.loc[0,"emti"]= emti/ilen
rawData.iloc[-1,-1]= rawData.iloc[lv,11]
rawData.loc[0,"emtp"]= emtp/ilen
rawData.iloc[-1,-1]= rawData.iloc[lv,12]

rawData.loc[0,"extv"]= extv/ilen
rawData.iloc[-1,-1]= rawData.iloc[lv,13]
rawData.loc[0,"exti"]= exti/ilen
rawData.iloc[-1,-1]= rawData.iloc[lv,14]
rawData.loc[0,"extp"]= extp/ilen
rawData.iloc[-1,-1]= rawData.iloc[lv,15]

rawData.loc[0,"neuv"]= neuv/ilen
rawData.iloc[-1,-1]= rawData.iloc[lv,19]
rawData.loc[0,"neui"]= neui/ilen
rawData.iloc[-1,-1]= rawData.iloc[lv,20]
rawData.loc[0,"neup"]= neup/ilen
rawData.iloc[-1,-1]= rawData.iloc[lv,21]

rawData.loc[0,"rsvp"]= rsvp/ilen
rawData.iloc[-1,-1]= rawData.iloc[lv,16]

rawData.loc[0,"md"]= md/ilen #fuel mass flow [mg/s]
rawData.loc[1,"md"]= md #fuel used [mg]
rawData.iloc[-1,-1]= 18-(md/1000) #fuel left [g]



# Data Exporting #############################################################
# Saving the propulsion dataframe to a CSV file
#rawData.to_csv("CLIMB_Grafana_Prpln_Tool.csv", index=False)
rawData.to_csv("Test_Prpln_Tool.csv", index=False)






