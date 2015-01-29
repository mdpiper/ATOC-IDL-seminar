; IDL Version 8.4, Mac OS X (darwin x86_64 m64)
; Journal File for mpiper@rl1gw1-131-224-dhcp.int.colorado.edu
; Working directory: /Users/mpiper/IDLWorkspace84/Default
; Date: Thu Jan 29 09:41:00 2015
 
; Data types
a = 1
help, a
b = 4.0
help, b
c = 'hi'
help, c
; Interesting behaviors
x = 30000 + 10000
help, x
print, 2L^15
;       32768
print, 2L^15 - 1
;       32767
x = 30000 + 10000L
help, x
; Interesting behavior, II
pi = 3.1415926535897
print, pi
;      3.14159
print, pi, format='(f15.13)'
;3.1415927410126
help, pi
pi = 3.1415926535897d
print, pi, format='(f15.13)'
;3.1415926535897
pi
;       3.1415926535896999
!pi
;       3.1415927
!dpi
;       3.1415926535897931
!const.dpi
; % Tag name DPI is undefined for structure !CONST.
!const.pi
;       3.1415926535897931
!const
;{
;    "ALPHA": 0.0072973525697999997,
;    "AU": 149597870700.00000,
;    "C": 299792458.00000000,
;    "DTOR": 0.017453292519943299,
;    "E": 1.6021765650000000e-19,
;    "EPS0": 8.8541878170000005e-12,
;    "EULER": 2.7182818284590451,
;    "F": 96485.336500000005,
;    "G": 6.6742799999999995e-11,
;    "GN": 9.8066499999999994,
;    "H": 6.6260695699999996e-34,
;    "HBAR": 1.0545717259999999e-34,
;    "I": (0.0000000000000000,1.0000000000000000),
;    "K": 1.3806488000000000e-23,
;    "LY": 9460730472580800.0,
;    "M_EARTH": 5.9721863899999997e+24,
;    "M_SUN": 1.9884158605700001e+30,
;    "ME": 9.1093829099999999e-31,
;    "MN": 1.6749273509999999e-27,
;    "MP": 1.6726217770000001e-27,
;    "MU0": 1.2566370613999999e-06,
;    "N0": 2.6867805000000001e+25,
;    "NA": 6.0221412899999997e+23,
;    "P0": 101325.00000000000,
;    "PARSEC": 30856775814671912.,
;    "PHI": 1.6180339887498949,
;    "PI": 3.1415926535897931,
;    "R": 8.3144621000000001,
;    "R_EARTH": 6378136.5999999996,
;    "RTOD": 57.295779513082323,
;    "RE": 2.8179403267000001e-15,
;    "RYDBERG": 10973731.568538999,
;    "SIGMA": 5.6703730000000003e-08,
;    "T0": 273.14999999999998,
;    "U": 1.6605389209999998e-27,
;    "VM": 0.022413967999999999
;}
; Data structures
; Scalars and arrays
a = 1
b
;       4.0000000
c
;hi
d = [1.0, 2.0, 3.0, 4.0]
help, g
help, d
e = bytarr(1.3e4, 1.2e4) 
help, e
; Array versus index generators
v1 = fltarr(5)
v2 = findgen(5)
help, v1, v2
v1
;       0.0000000       0.0000000       0.0000000       0.0000000
;       0.0000000
v2
;       0.0000000       1.0000000       2.0000000       3.0000000
;       4.0000000
; Access info in arrays
a = ['my', 'dog', 'has', 'fleas']
help, a
a[1] 
;dog
b = indgen(4, 6)
help, b
b
;       0       1       2       3
;       4       5       6       7
;       8       9      10      11
;      12      13      14      15
;      16      17      18      19
;      20      21      22      23
b[1,4]
;      17
b[17]
;      17
; Structures (and maybe hashes & lists)
b = {make:'Specialized', model:'Stumpjumper', year:1996}
b
;{
;    "MAKE": "Specialized",
;    "MODEL": "Stumpjumper",
;    "YEAR": 1996
;}
b.make
;Specialized
b.year + 10
;    2006
b = create_struct(b, 'color', [0,0,0])
b
;{
;    "MAKE": "Specialized",
;    "MODEL": "Stumpjumper",
;    "YEAR": 1996,
;    "COLOR": [0, 0, 0]
;}
; Represent the bike as a hash
h = hash()
help, h
h['make'] = 'Specialized'
help, h
h
;{
;    "make": "Specialized"
;}
h['model'] = 'Stumpjumper'
h['year'] = 1996
h['color'] = [0,0,0]
h['make']
;Specialized
; Represent the bike a list.
l = list() 
l.add('Specialized')
; % Attempt to call undefined method: 'LIST::ADD'.
l.add, 'Specialized'
help, l
l[0] 
;Specialized
l.add, 1996
; A quick Graphics example
; Define a sine and a cosine wave.
t = findgen(361)*!dtor
print, min(t), max(t)
;      0.00000      6.28319
x = sin(t)
y = cos(t)
print, min(x), max(x)
;     -1.00000      1.00000
p = plot(t, x)
; Change the line to red
p.color = 'red'
; There's lots of other properties
p
;PLOT <5197>
;  ANTIALIAS                 = 1
;  ASPECT_RATIO              = 0.0000000
;  ASPECT_Z                  = 0.0000000
;  BACKGROUND_COLOR          = 255 255 255
;  BACKGROUND_TRANSPARENCY   = 100
;  CLIP                      = 1
;  COLOR                     = 255   0   0
;  CROSSHAIR                 = CROSSHAIR <6676> ...
;  DEPTH_CUE                 = 0.00000      0.00000
;  EQN_SAMPLES               = 0
;  EQN_USERDATA              = !NULL
;  EQUATION                  = ''
;  ERRORBAR_CAPSIZE          = 0.20000000
;  ERRORBAR_COLOR            = 0   0   0
;  ERRORBAR_LINESTYLE        = 0
;  ERRORBAR_THICK            = 1
;  EYE                       = 2.5021883
;  FILL_BACKGROUND           = 0
;  FILL_COLOR                = 128 128 128
;  FILL_LEVEL                = 1.0000000e-300
;  FILL_TRANSPARENCY         = 0
;  HIDE                      = 0
;  HISTOGRAM                 = 0
;  LINESTYLE                 = 0
;  MAX_VALUE                 = NaN
;  MIN_VALUE                 = NaN
;  NAME                      = 'Plot'
;  POSITION                  = 0.12656250      0.12890625      0.92187500      0.88085938
;  RGB_TABLE                 = 0   0   0 ...
;  STAIRSTEP                 = 0
;  SYMBOL                    = 0
;  SYM_COLOR                 = 255   0   0
;  SYM_FILLED                = 0
;  SYM_FILL_COLOR            = 255   0   0
;  SYM_INCREMENT             = 1
;  SYM_OBJECT                = <NullObject>
;  SYM_SIZE                  = 1.0000000
;  SYM_THICK                 = 1.00000
;  SYM_TRANSPARENCY          = 0
;  THICK                     = 1.00000
;  TITLE                     = <NullObject>
;  TRANSPARENCY              = 0
;  WINDOW_TITLE              = 'Plot'
;  XRANGE                    = 0.0000000       8.0000000
;  YRANGE                    = -1.0000000       1.0000000
;  ZRANGE                    = 0.0000000       0.0000000
;  ZVALUE                    = 0.0000000
p.thick = 2
p.xtitle = 'Time'
p.ytitle = 'Amplitude'
p.title = 'Sine and Cosine Waves'
; Display the cosine wave
q = plot(t, y, /overplot, color='blue', thick=2)
; Save to a PNG file
p.save, 'waves.png'
f = file_which('X174.29.255.181.65.14.23.9.nc', /include_current)
f
;/Users/mpiper/IDLWorkspace84/Default/X174.29.255.181.65.14.23.9.nc
help, x['hgt']
help, x['lon']
x['lon']
;       0.0000000       2.5000000       5.0000000       7.5000000
;       10.000000       12.500000       15.000000       17.500000
;       20.000000       22.500000       25.000000       27.500000
;       30.000000       32.500000       35.000000       37.500000
;       40.000000       42.500000       45.000000       47.500000
;       50.000000       52.500000       55.000000       57.500000
;       60.000000       62.500000       65.000000       67.500000
;       70.000000       72.500000       75.000000       77.500000
;       80.000000       82.500000       85.000000       87.500000
;       90.000000       92.500000       95.000000       97.500000
;       100.00000       102.50000       105.00000       107.50000
;       110.00000       112.50000       115.00000       117.50000
;       120.00000       122.50000       125.00000       127.50000
;       130.00000       132.50000       135.00000       137.50000
;       140.00000       142.50000       145.00000       147.50000
;       150.00000       152.50000       155.00000       157.50000
;       160.00000       162.50000       165.00000       167.50000
;       170.00000       172.50000       175.00000       177.50000
;       180.00000       182.50000       185.00000       187.50000
;       190.00000       192.50000       195.00000       197.50000
;       200.00000       202.50000       205.00000       207.50000
;       210.00000       212.50000       215.00000       217.50000
;       220.00000       222.50000       225.00000       227.50000
;       230.00000       232.50000       235.00000       237.50000
;       240.00000       242.50000       245.00000       247.50000
;       250.00000       252.50000       255.00000       257.50000
;       260.00000       262.50000       265.00000       267.50000
;       270.00000       272.50000       275.00000       277.50000
;       280.00000       282.50000       285.00000       287.50000
;       290.00000       292.50000       295.00000       297.50000
;       300.00000       302.50000       305.00000       307.50000
;       310.00000       312.50000       315.00000       317.50000
;       320.00000       322.50000       325.00000       327.50000
;       330.00000       332.50000       335.00000       337.50000
;       340.00000       342.50000       345.00000       347.50000
;       350.00000       352.50000       355.00000       357.50000
x['lat']
;       90.000000       87.500000       85.000000       82.500000
;       80.000000       77.500000       75.000000       72.500000
;       70.000000       67.500000       65.000000       62.500000
;       60.000000       57.500000       55.000000       52.500000
;       50.000000       47.500000       45.000000       42.500000
;       40.000000       37.500000       35.000000       32.500000
;       30.000000       27.500000       25.000000       22.500000
;       20.000000       17.500000       15.000000       12.500000
;       10.000000       7.5000000       5.0000000       2.5000000
;       0.0000000      -2.5000000      -5.0000000      -7.5000000
;      -10.000000      -12.500000      -15.000000      -17.500000
;      -20.000000      -22.500000      -25.000000      -27.500000
;      -30.000000      -32.500000      -35.000000      -37.500000
;      -40.000000      -42.500000      -45.000000      -47.500000
;      -50.000000      -52.500000      -55.000000      -57.500000
;      -60.000000      -62.500000      -65.000000      -67.500000
;      -70.000000      -72.500000      -75.000000      -77.500000
;      -80.000000      -82.500000      -85.000000      -87.500000
;      -90.000000
;File "view_20thcenheights.mp4" written to current directory.
