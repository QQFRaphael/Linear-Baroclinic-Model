* NCEP climatology interporated into T21 Gaussian grid
*
dset ^qqf.t42l20.grd
OPTIONS SEQUENTIAL
options big_endian
undef 9.999E+20
title NCEP cdas climatology (T21)
XDEF 128 LINEAR 0. 2.8125
YDEF  64 LEVELS
 -87.8638 -85.0965 -82.3129 -79.5256 -76.7369 -73.9475 -71.1577
 -68.3678 -65.5776 -62.7873 -59.9970 -57.2066 -54.4162 -51.6257
 -48.8352 -46.0447 -43.2542 -40.4636 -37.6731 -34.8825 -32.0919
 -29.3014 -26.5108 -23.7202 -20.9296 -18.1390 -15.3484 -12.5578
 -9.76715 -6.97653 -4.18592 -1.39531 1.39531 4.18592 6.97653
  9.76715 12.5578 15.3484 18.1390 20.9296 23.7202 26.5108
  29.3014 32.0919 34.8825 37.6731 40.4636 43.2542 46.0447
  48.8352 51.6257 54.4162 57.2066 59.9970 62.7873 65.5776
  68.3678 71.1577 73.9475 76.7369 79.5256 82.3129 85.0965
  87.8638
tdef      1 linear 00Z01jan58 1mo
zdef 17 levels
1000 925 850 700 600 500 400 300 250 200 150 100 70 50 30 20 10
vars      7
z    17 99 Geopotential height [gpm]
rh    8 99 Relative humidity [%]
q     8 99 Specific humidity [kg/kg]
t    17 99 Temperature [K]
u    17 99 zonal wind [m/s]
v    17 99 meridional wind [m/s]
omg  12 99 Pressure vertical velocity [Pa/s]
endvars
