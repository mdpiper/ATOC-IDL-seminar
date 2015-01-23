; docformat = 'rst'
;+
; Reads data from a NOAA-CIRES 20th Century Reanalysis V2 file (netCDF classic)
; containing global, 2.0-degree resolution, mean daily 500 mb geopotential 
; heights (GPH) in meters.
;
; 20th Century Reanalysis V2 data are provided by the NOAA/OAR/ESRL PSD, 
; Boulder, Colorado, USA, from their website at 
; `http://www.esrl.noaa.gov/psd <http://www.esrl.noaa.gov/psd>`. (Hi, Gil!)
;
; :params:
;  file: in, required, type=string
;   The path (or URL) to a 20th Century Reanalysis V2 file.
;
; :requires:
;  IDL 8.1
;
; :returns:
;  A hash containing time, lon, lat and hgt variables from the file.
;
; :examples:
;  Try the example main program included in this file with::
;   IDL> .r read_20thcenheights
;   
; :author:
;  Mark Piper, VIS, 2011
;-
function read_20thcenheights, file
   compile_opt idl2
   
   ; Open the file, returning a file identifier (id).
   f_id = ncdf_open(file)
   
   ; Get ids for the desired variables.
   var_names = ['time', 'lon', 'lat', 'hgt']
   var_ids = hash()
   foreach name, var_names do var_ids[name] = ncdf_varid(f_id, name)
   
   ; Read the variables from the netCDF file into IDL.
   vars = hash()
   foreach id, var_ids, name do begin
      ncdf_varget, f_id, id, tmp ; pass by reference
      vars[name] = tmp
   endforeach
   
   ; Get attributes for the hgt values.
   atts_names = ['add_offset', 'scale_factor', 'missing_value']
   atts = hash()
   foreach name, atts_names do begin
      ncdf_attget, f_id, var_ids['hgt'], name, tmp ; pass by reference
      atts[name] = tmp
   endforeach
   
   ; Close the netCDF file.
   ncdf_close, f_id
   
   ; Apply the offset and scale factor to the hgt values.
   vars['hgt'] = vars['hgt']*atts['scale_factor'] + atts['add_offset']
   
   ; Locate missing values and replace with NaN.
   tol = 1.0
   i_missing = where(abs(vars['hgt'] - atts['missing_value']) le tol, /null)
   vars['hgt', i_missing] = !values.f_nan 
   
   ; Remove the spurious time dimension from the hgt data.
   vars['hgt'] = reform(vars['hgt'])
   
   ; Return the variables in a hash.
   return, vars
end

; Example
f = file_which('X174.29.255.181.65.14.23.9.nc', /include_current)
x = read_20thcenheights(f)
help, x
end

