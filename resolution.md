# resolution.md

### Resolution $res$ (MP)

$$res=\frac{res_0}{4^{mag-1}}\{(1)}$$

hence

$$res_0=res\cdot4^{mag-1}\{(2)}$$

and

$$mag=\log_4(4)+\log_4{(res_0)}-\log_4{(res)}\{(3)}$$

$$=\frac{\log{(4)}+\log{(res_0)}-\log{(res)}}{\log{(4)}}\{(5)}$$

where

$mag$ = magnification factor  
$res_0$ = initial resolution (MP)  
$res$ = resolution in MP  

### Focal length $f$ (35mm) 

$$f=f_0\cdot2^{mag-1}\{(6)}$$

hence

$$f_0=f\cdot2^{1-mag}\{(7)}$$

and

$$mag=\log_2{(2)}-\log_2{(f_0)}+\log_2{(f)}\{(8)}$$

$$=\frac{\log{(2)}-\log{(f_0)}+\log{(f)}}{\log{(2)}}\{(9)}$$

where

$mag$ = magnification factor  
$f_0$ = initial focal length (35mm)  
$f$ = focal length (35mm)  

### Magnification $x$

$$x=\log_2(2)+\log_2(mag)\{(10)}$$

$$=\frac{\log(2)+\log(mag)}{\log(2)}\{(11)}$$

<br>

therefore

$$res=\frac{res_0\cdot f_0^2}{f^2},\{(12)}$$

$$res_0=\frac{f^2\cdot res}{f_0^2}\{(13)}$$

and

$$f=\frac{\sqrt{res_0\cdot res}\cdot|res|\cdot |f_0|}{res^2},\{(14)}$$

$$f_0=\frac{\sqrt{res_0\cdot res}\cdot|res_0|\cdot |f|}{res_0^2}\{(15)}$$

where

$f_0$ = initial focal length (35mm)  
$res_0$ = initial resolution (MP)  
$f$ = focal length after magnification  
$res$ = resolution after magnification  
