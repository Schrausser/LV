#  LV

Android exposure calculator Lightvalues `LV` for calculating *aperture values*  ​ $Av$ corresponding to *light values*[^1] by *shifting* the time value $Tv=s^{-1}$ or arithmetic $ISO$ speed value $S$ in steps $k$ according to the common classification,  where

$$Tv_{n-k}=Tv_n\cdot 2^k,S_{n+k}=S_n\cdot \sqrt{2}^k,\{(1)}$$

$$Tv_{n+k}=\frac{Tv_n}{2^k},S_{n-k}=\frac{S_n}{\sqrt{2}^k}\{(2)}$$

and

$$Av_{(Tv_n)}=Av_{(Tv_{n-k})}\cdot\sqrt[]2^k=\frac{Av_{(Tv_{n+k})}}{\sqrt[]2^k},\{(3)}$$

$$Av_{(S_n)}=Av_{(S_{n+k})}\cdot\sqrt[]2^k=\frac{Av_{(S_{n-k})}}{\sqrt[]2^k}.\{(4)}$$

Therefore $Av$ is calculated from $Tv$ or $S$ by

$$Av_{Tv}=Av_{Tv_0}\cdot a_{Tv},Av_S=Av_{S_0}\cdot a_{S}\{(5)}$$

with

$$a_{Tv}=2^{\frac{1}{2}\cdot\log2\frac{Tv_0}{Tv}}=e^{\frac{1}{2}\cdot\log\frac{Tv_0}{Tv}},\{(6)}$$


$$a_S=2^{\frac{1}{2}\cdot\log2\frac{S}{S_0}}=e^{\frac{1}{2}\cdot\log\frac{S}{S_0}}.\{(7)}$$

The shutter speed is set in the range between $Tv=32000$ and 2 hours $Tv=0.00013\overline 8$,  aperture ranges from $Av=0.5$ to $Av=152$ and speed $S$ is set to range between *ISO 0.4* and *ISO 102400*.
On aperture, shutter speed and exposure see e.g. Roberts ([1995](https://doi.org/10.1007/978-1-349-13506-6_5)), Beaver ([2018](https://doi.org/10.1088/2053-2571/aae504ch3)), Bernacki ([2020](https://doi.org/10.1007/s11042-019-08318-1)) and Simon et al. ([2022](https://doi.org/10.3390/s22051871)).

Logarithmic speed $S°$ (s. Allbright,  [1991](https://doi.org/10.1080/00223638.1991.11737126)) is transformed from arithmetic speed $S$ by

$$S°=10\cdot\log10(S)+1=\frac{10\cdot\log{(S)}}{\log{(10)}}+1,\{(8)}$$

$$S=10^{\frac{S°-1}{10}}.\{(9)}$$


The *exposure value* $Ev$  is calculated from  $Tv$ and $Av$, where

$$Ev=\log2\frac{{Av}^2}{Tv^{-1}}=\frac{\log(Tv\cdot Av^2)}{\log(2)},Tv=\frac{2^{Ev}}{Av^2},Av=\frac{\sqrt{2^{Ev}\cdot Tv}}{Tv}.\{(10)}$$

The total luminous flux or *illuminance* $E_V$ in *lux* $lx$, where $lx=\frac{lm}{m^2}$ results from $Ev$ and $S$ by

$$E_V=250\cdot \frac{2^{Ev}}{S}.\{(11)}$$

For logarithmic functions in general see e.g. Marsden and Weinstein ([1985](https://doi.org/10.1007/978-1-4612-5024-1_9)), Howie ([2001](https://doi.org/10.1007/978-1-4471-0341-7_6)) and Sobot ([2021](https://doi.org/10.1007/978-3-030-79545-0_4)).

Presets for time and aperture combinations at *ISO 100/21°* (8) are given (s. Tab. 1), with aperture values $Av$ ​​are rounded to one decimal place. Custom *time-aperture-ISO* combinations for *exposure values* $Ev$ (10) or *illuminance* $E_V$ (11) can be achieved by *shifting*  $Av$ itself. 

Table 1. Exposure presets for $Tv$, $Av$ and $Ev$ (10) at *ISO 100/21°* by condition *cnd*.
~~~
cnd    	 	Tv	Av	Ev

Sun  		125  	11	14
Cloud 		125  	8	13
Overcast  	60  	5.6	11
Dawn 		15 	4	8
Indoors 	15 	2.8	7
~~~

In addition, direct calculations (5) of aperture $Av$ from shutter speed $Tv$ (6) and $S$ (7) can be performed (c.f. Schrausser, [2025](https://doi.org/10.5281/zenodo.14721085)). This should be used when shutter speeds outside the usual steps (1) (2) are present or when only *a single* shutter speed is available, as in the case of the so-called mechanical *emergency* shutter speed (s. Tab. 2).

Table 2. $Av$ for $Tv$ (5) (6) at *ISO 100/21°* and *ISO 400/27°* with $Ev$ (10) by condition *cnd*.
~~~
cnd		Tv				Ev
		250	100	60	45
ISO 100/21°
Sun  		7.8  	12.3	15.9	18.3	13.9
Cloud 		5.7  	9.0	11.6	13.3	13.0
Overcast  	2.8  	4.3	5.6	6.5	10.9
Dawn 		1.0 	1.6	2.0	2.3	7.9
Indoors 	0.7 	1.1	1.4	1.6	6.9

ISO 400/27°	
Sun		15.6	24.6	32.0	36.7	15.9
Cloud		11.4	18.0	23.2	26.6	15.0
Overcast	5.6	8.6	11.2	13.0	12.9
Dawn		2.0	3.1	4.0	4.6	9.9
Indoors		1.4	2.2	2.8	3.2	8.9
~~~

Further manuals or introductory literature on photography are given by e.g. Hedgecoe ([1977](https://books.google.com/books?id=eyXrAAAAMAAJ), [2009](https://books.google.com/books?id=9N4C0HMzZFMC)) and Jacobson et al. ([2000](https://doi.org/10.4324/9780080510965)), see also Kenneth Mees ([1931](http://www.jstor.org/stable/27824446)), Cannon and Hunt ([1981](http://www.jstor.org/stable/24964586)), Hitchcock ([1989](http://www.jstor.org/stable/40793474)), Current et al. ([2000](https://books.google.com/books?id=maKozwEACAAJ)), Friedman and Ross ([2003](https://doi.org/10.1007/978-3-642-55755-2)) or Pavlidis ([2022](https://doi.org/10.1007/978-3-031-06252-0)).

[^1]: Light level for incident or reflected light on a logarithmic scale. 

## References

Allbright, G. S. (1991). Emulsion Speed Rating Systems. *The Journal of Photographic Science 39* (2): 95–99. [https://doi.org/10.1080/00223638.1991.11737126](https://doi.org/10.1080/00223638.1991.11737126)

Beaver, J. (2018). Shutter Speed and Aperture. In *The Physics and Art of Photography*, 2:3-1 to 3-6. 2053-2571. Morgan & Claypool Publishers. [https://doi.org/10.1088/2053-2571/aae504ch3](https://doi.org/10.1088/2053-2571/aae504ch3)

Bernacki, J. (2020). Automatic Exposure Algorithms for Digital Photography. *Multimedia Tools and Applications 79* (19): 12751–76. [https://doi.org/10.1007/s11042-019-08318-1](https://doi.org/10.1007/s11042-019-08318-1)

Cannon, T. M., & Hunt, B. R. (1981). Image Processing by Computer. *Scientific American 245* (4): 214–25. [http://www.jstor.org/stable/24964586](http://www.jstor.org/stable/24964586)

Current, I., Compton, J. C., & Zakia, R. D. (2000). *Basic Photographic Materials and Processes*. Amsterdam: Elsevier Science; Technology. [https://books.google.com/books?id=maKozwEACAAJ](https://books.google.com/books?id=maKozwEACAAJ)

Friedman, A., & Ross, D. S. (2003). *Mathematical Models in Photographic Science*. Berlin, Heidelberg: Springer. [https://doi.org/10.1007/978-3-642-55755-2](https://doi.org/10.1007/978-3-642-55755-2)

Hedgecoe, J. (1977). *The Photographer’s Handbook: A Complete Reference Manual of Techniques, Procedures, Equipment and Style*. 1st ed. New York: Knopf. [https://books.google.com/books?id=eyXrAAAAMAAJ](https://books.google.com/books?id=eyXrAAAAMAAJ)

———.  (2009). *New Manual of Photography*. London: Dorling Kindersley Limited. [https://books.google.com/books?id=9N4C0HMzZFMC](https://books.google.com/books?id=9N4C0HMzZFMC)

Hitchcock, M. (1989). Field Photography; a Guide to Basic Equipment. *Journal of Museum Ethnography*, no. 1: 4–6. [http://www.jstor.org/stable/40793474](http://www.jstor.org/stable/40793474)

Howie, J. M. (2001). The Logarithmic and Exponential Functions. In *Real Analysis*, 165–79. London: Springer. [https://doi.org/10.1007/978-1-4471-0341-7_6](https://doi.org/10.1007/978-1-4471-0341-7_6)

Jacobson, R., Ray, S., Attridge, G. G., & Axford, N. (2000). *Manual of Photography*. 9th ed. Oxfordshire, UK: Routledge. [https://doi.org/10.4324/9780080510965](https://doi.org/10.4324/9780080510965)

Kenneth Mees, C. E. (1931). The Science of Photography. *Sigma Xi Quarterly 19* (1): 1–19. [http://www.jstor.org/stable/27824446](http://www.jstor.org/stable/27824446)

Marsden, J., & Weinstein, A. (1985). Exponentials and Logarithms. In *Calculus i*, 307–35. New York, NY: Springer. [https://doi.org/10.1007/978-1-4612-5024-1_9](https://doi.org/10.1007/978-1-4612-5024-1_9)

Pavlidis, G. (2022). *Foundations of Photography: A Treatise on the Technical Aspects of Digital Photography*. Cham: Springer International Publishing. [https://doi.org/10.1007/978-3-031-06252-0](https://doi.org/10.1007/978-3-031-06252-0)

Roberts, G. (1995). Exposure. In *Mastering Photography*, 76–87. London: Macmillan Education UK. [https://doi.org/10.1007/978-1-349-13506-6_5](https://doi.org/10.1007/978-1-349-13506-6_5)

Schrausser, D. G. (2025). Schrausser/HP_Prime_MATH: --version--. *Zenodo. --Month-- 2025*. [https://doi.org/10.5281/zenodo.14721085](https://doi.org/10.5281/zenodo.14721085)

Simon, G., Vakulya, G., & Rátosi, M. (2022). The Way to Modern Shutter Speed Measurement Methods: A Historical Overview. *Sensors 22* (5): 1871. [https://doi.org/10.3390/s22051871](https://doi.org/10.3390/s22051871)

Sobot, R. (2021). Exponential and Logarithmic Functions. In *Engineering Mathematics by Example*, 51–66. Cham: Springer International Publishing. [https://doi.org/10.1007/978-3-030-79545-0_4](https://doi.org/10.1007/978-3-030-79545-0_4)
 
