from spacetrack import SpaceTrackClient
import numpy as np
import ephem

norad_id = 56937
st = SpaceTrackClient('email', 'password') # space-track.org account necessary (is free)
tle_string = st.tle_latest(norad_cat_id=norad_id, ordinal=1, format='tle')

line1, line2 = tle_string.strip().split('\n')

text_file = open("current_TLE.txt", "w")
text_file.write(line1)
text_file.write("\n")
text_file.write(line2)
text_file.close()


tle = ephem.readtle('EIVE', line1, line2)

sat_name = tle.name
sat_inc = tle.inc
sat_raan = tle.raan
sat_ecc = tle.e
sat_argp = tle.ap
sat_a = tle.M
sat_meanmot = tle.n
sat_meanmot = tle.epoch
print(sat_name)
print(sat_inc)
print(sat_meanmot)

# G = 6.674e-20      # gravitational constant in km3/kg/s2
# muh = mass*G         # gravitational parameter earth in km3/s2

# # sat_meanmot = 24/(T_sec/60/60)
# T_sec = 60*60*24/sat_meanmot
# # T_sec = 2*np.pi/np.sqrt(muh)*a**(3/2)
# sat_a = (T_sec/(2*np.pi)*np.sqrt(muh))**(2/3)

# ra = sat_a*(sat_ecc+1)
# rp = sat_a*(1-sat_ecc)

    #return(sat_name,ra,rp,sat_inc,sat_ecc)  #,sat_a,sat_raan,sat_argp,sat_meanmot)
