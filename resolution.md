# resolution.md

### Resolution $res$ (MP)

$$res=\frac{res_0}{4^{mag-1}}\{(1)}$$

hence

$$res_0=res\cdot4^{mag-1}\{(2)}$$

and

$$mag=\log_4(4)+\log_4{(res_0)}-\log_4{(res)}\{(3)}$$

$$=\frac{\log{(4)}+\log{(res_0)}-\log{(res)}}{\log{(4)}}\{(4)}$$

where

$mag$ = magnification factor  
$res_0$ = initial resolution (MP)  
$res$ = resolution in MP  

### Focal length $f$ (35mm) 

$$f=f_0\cdot2^{mag-1}\{(5)}$$

hence

$$f_0=f\cdot2^{1-mag}\{(6)}$$

and

$$mag=\log_2{(2)}-\log_2{(f_0)}+\log_2{(f)}\{(7)}$$

$$=\frac{\log{(2)}-\log{(f_0)}+\log{(f)}}{\log{(2)}}\{(8)}$$

where

$mag$ = magnification factor  
$f_0$ = initial focal length (35mm)  
$f$ = focal length (35mm)  

### Magnification $x$

$$x=\log_2(2)+\log_2(mag)\{(9)}$$

$$=\frac{\log(2)+\log(mag)}{\log(2)}\{(10)}$$

<br>

therefore

$$res=\frac{res_0\cdot f_0^2}{f^2},\{(11)}$$

$$res_0=\frac{f^2\cdot res}{f_0^2}\{(12)}$$

and

$$f=\frac{\sqrt{res_0\cdot res}\cdot|res|\cdot |f_0|}{res^2},\{(13)}$$

$$f_0=\frac{\sqrt{res_0\cdot res}\cdot|res_0|\cdot |f|}{res_0^2}\{(14)}$$

where

$f_0$ = initial focal length (35mm)  
$res_0$ = initial resolution (MP)  
$f$ = focal length after magnification  
$res$ = resolution after magnification  
