* test response pattern (full matrix)
DSET ^rsp.t21l5.classic.grd
* BYTESWAPPED
OPTIONS SEQUENTIAL YREV
TITLE Linear Response
UNDEF -999.
XDEF 64 LINEAR 0. 5.625
YDEF 32 LEVELS -85.761 -80.269 -74.745 -69.213 -63.679 -58.143 -52.607 
-47.070 -41.532 -35.995 -30.458 -24.920 -19.382 -13.844 -8.3067 -2.7689 
2.7689 8.3067 13.844 19.382 24.920 30.458 35.995 41.532 47.070 52.607 
58.143 63.679 69.213 74.745 80.269 85.761
ZDEF 5  LEVELS 1000 850 500 250 30
TDEF 1 LINEAR 15jan0000 1MO
VARS 5
v      5 99 stream function         [m**2 s**-1]
d      5 99 velocity potential      [m**2 s**-1]
t      5 99 temperature             [K]
z      5 99 geopotential height     [m]
p      1 99 surface pressure        [hPa]
ENDVARS
