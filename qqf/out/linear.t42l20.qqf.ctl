* sample file fot products of a linear integration
DSET ^linear.t42l20.qqf.grd
OPTIONS SEQUENTIAL YREV
options big_endian
TITLE time-integration
UNDEF -999.
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
ZDEF 20  LEVELS 1000 950 900 850 700 600 500 400 300 250 
200 150 100  70  50 30  20  10   7   5
TDEF 50 LINEAR 15jan0000 1dy
VARS 8
psi    20 99 stream function     [m**2/s]
chi    20 99 velocity potential  [m**2/s]
u      20 99 zonal wind          [m/s]
v      20 99 meridional wind     [m/s]
w      20 99 p-vertical velocity [hPa/s]
t      20 99 temperature         [K]
z      20 99 geopotential height [m]
p       1 99 surface pressure    [hPa]
ENDVARS
