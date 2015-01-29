; docformat = 'rst'
;+
; An example of visualizing 500 mb geopotential heights read from a NOAA-CIRES
; 20th Century Reanalysis V2 file. For more information on the 20th Century 
; Reanalysis project, please see::
;  
;  http://www.esrl.noaa.gov/psd/data/gridded/data.20thC_ReanV2.html.
;
; :pre:
;  The 20th Century Reanalysis V2 file 'X174.29.255.181.65.14.23.9.nc'.
;
; :uses:
;  READ_20THCENHEIGHTS
;     
; :keywords:
;  make_movie: in, optional, type=Boolean
;   Set this keyword to create a movie, 'view_20thcenheights.mp4', showing 
;   a time series of a month of daily 500 mb heights.
;   
; :requires:
;  IDL 8.2.1
;
; :examples:
;  Try the example main program included in this file with::
;   IDL> .r view_20thcenheights
;   
; :author:
;	Mark Piper, VIS, 2011
;-
pro view_20thcenheights, make_movie=make_movie
   compile_opt idl2
   
   f = file_which('X174.29.255.181.65.14.23.9.nc', /include_current)
   d = read_20thcenheights(f)
   
   ; Set up a window with a map projection.
   xsize = 640
   ysize = 512
   w = window(dimensions=[xsize,ysize])
   m = map('Orthographic', $
      center_latitude=30, $
      center_longitude=120, $
      limit=[-90, 0, 90, 360], $ ; crosses IDL
      /current, $
      title='Daily Mean 500mb Geopotential Heights', $
      color='gray')
   
   ; Set up custom contour levels based on the range of geopotential heights.
   ; Display the global 500 mb geopotential height on January 1 with contours.
   nlevels = 15
   levels = findgen(nlevels)*100 + 4600 ; m
   g_heights = contour(d['hgt',*,*,0], d['lon'], d['lat'], $
      overplot=m, $
      c_value=levels, $
      rgb_table=colortable(72, /reverse), $
      grid_units='degrees', $
      /fill, $
      transparency=20)
      
   ; Add continental outlines, colorbar and text annotations.
   g_continents = mapcontinents(color='black')
   g_colorbar = colorbar(target=g_heights, $
      orientation=1, $
      textpos=1, $
      major=4, $
      font_size=10, $ 
      transparency=g_heights.transparency, $
      border=1, $ ; boxes around cells
      position=[0.86, 0.20, 0.88, 0.80], $
      title='Height (m)')
   g_date = text(0.025, 0.20, '2010 January 01', font_size=12)
   subtitle = ['NOAA-CIRES 20th Century Reanalysis Project', $
      'http://www.esrl.noaa.gov/psd/data/gridded/data.20thC_ReanV2.html']
   g_subtitle = text(0.025, 0.025, subtitle, font_size=8)

   if ~keyword_set(make_movie) then return

   ; Create the video object and add metadata.
   video_file = 'view_20thcenheights.mp4'
   video = idlffvideowrite(video_file)
   video.setmetadata, 'title', 'Daily Mean 500mb Geopotential Heights, January 2010'
   
   ; Initialize the video stream. 
   framerate = 7.5 ; the playback speed in frames per second
   stream = video.addvideostream(xsize, ysize, framerate)
   
   ; Write the current visualization as the first frame of the video.
   timestamp = video.put(stream, w.copywindow())
   help, timestamp
   
   ; Loop through the remaining 30 days of January.
   for i=1, 30 do begin
      g_heights.setdata, d['hgt', *, *, i]
      g_date.string = '2010 January ' + string(i+1, format='(i2.2)')
      timestamp = video.put(stream, w.copywindow())
      help, timestamp
   endfor
   
   ; Destroy video object -- needed to close video file.
   video.cleanup
   print, 'File "' + video_file + '" written to current directory.'
end

; Example
view_20thcenheights, make_movie=0
end

