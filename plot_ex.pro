; docformat = 'rst'
;+
; An example of using IDL Graphics.
; 
; :requires:
;  IDL 8.0 
;
; :author:
;  Mark Piper, VIS, 2010
;-

; Define a sine and a cosine wave.
t = findgen(361)*!dtor
x = sin(t)
y = cos(t)

; Display the sine wave.
p = plot(t, x)

; Change the line color to red.
p.color = 'red'

; What other properties of the plot are available?
print, p

; Modify a few other properties.
p.thick = 2
p.xtitle = 'Time'
p.ytitle = 'Amplitude'
p.title = 'Sine and Cosine Waves'

; Display the cosine wave.
q = plot(t, y, color='blue', thick=2, /overplot)

; Display a zero line.
!null = plot(p.xrange, [0,0], linestyle='dotted', color='gray', /overplot)

; Add a legend. (Don't include zero line.)
p.name = 'Sine'
q.name = 'Cosine'
lgd = legend(target=[p,q], position=[0.9,0.8])

; Save the result to a few different file formats.
p.save, 'plot_ex.jpg'
p.save, 'plot_ex.eps'
p.save, 'plot_ex.pdf'
end
