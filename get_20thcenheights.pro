; docformat = 'rst'
;+
; Downloads a NOAA-CIRES 20th Century Reanalysis V2 file (netCDF classic)
; containing global, 2.0-degree resolution, mean daily 500 mb geopotential 
; heights (GPH) in meters.
;
; 20th Century Reanalysis V2 data are provided by the NOAA/OAR/ESRL PSD, 
; Boulder, Colorado, USA, from their website at 
; `http://www.esrl.noaa.gov/psd <http://www.esrl.noaa.gov/psd>`. (Hi, Gil!)
;
; :requires:
;  IDL 8.1
;
; :post:
;  The file 'X174.29.255.181.65.14.23.9.nc' in your working directory. 
;
; :examples:
;  Run with::
;   IDL> get_20thcenheights
;   
; :author:
;  Mark Piper, 2015
;-
pro get_20thcenheights
   compile_opt idl2

   ftp_url = 'http://csdms.colorado.edu/pub/users/mapi8461/'
   nc_file = 'X174.29.255.181.65.14.23.9.nc'
   n = idlneturl()
   !null = n.get(filename=nc_file, url=ftp_url+nc_file)
end

; Example
get_20thcenheights
end
