! //////////////////////////////////////////////////
! // LV Lightvalues 
! // Exposure calculator
! // by Dietmar G. Schrausser (c) 2025
! //
_name$="LV"
_ver$="3.8.0"
CONSOLE.TITLE _name$
INCLUDE strg.inc
INCLUDE lv.inc
GOSUB values
sw=-3                          % // color switch  //
insw=1                         % // input switch  //
tv=10
av=18
av1=18
iso=18:iso$="100"  
!
m1:
IF sw=1:r=255:g=255:b=255:ENDIF
IF sw=0:r=0:g=0:b=0:ENDIF
IF sw=-1:r=80:g=30:b=30:ENDIF
IF sw=-2:r=30:g=80:b=30:ENDIF
IF sw=-3:r=80:g=90:b=180:ENDIF
GR.OPEN 255,r,g,b,0,1
GR.SCREEN sx,sy
dy=sy/3/4
txz0=sx/10
txz1=sx/2.5
txz2=sx/3.5
GR.TEXT.BOLD 1
IF insw=1 THEN GOSUB inpt
!
DO
 !
 insw=1
 GOSUB col
 !
 !                              % // AV shift     //
 GR.BOUNDED.TOUCH swavp,0,sy/3,sx/3,sy*2/3
 IF swavp=1
  IF av>1:av=av-1:rav=av:rtv=tv:ENDIF
  GOSUB sub1
 ENDIF
 GR.BOUNDED.TOUCH swavm,sx*2/3,sy/3,sx,sy*2/3
 IF swavm=1
  IF av<36:av=av+1:rav=av:rtv=tv:ENDIF
  GOSUB sub1
 ENDIF
 !                              % // menue        //
 GR.BOUNDED.TOUCH swin,sx/3,sy/3,sx*2/3,sy*2/3
 IF swin=1
  GOSUB inpt:GR.CLS
 ENDIF
 !                              % // TV shift     //
 GR.BOUNDED.TOUCH swtvp,0,0,sx/3,sy/3
 IF swtvp=1 
  IF tv>1:tv=tv-1:av=av-2:ENDIF
  GOSUB sub1
 ENDIF
 GR.BOUNDED.TOUCH swtvm,sx*2/3,0,sx,sy/3
 IF swtvm=1 
  IF tv<31:tv=tv+1:av=av+2:ENDIF
  GOSUB sub1
 ENDIF
 !                              % // iso shift    //
 GR.BOUNDED.TOUCH swisop,sx*2/3,sy*2/3,sx,sy
 IF swisop=1
  IF iso<39:iso=iso+1
   av=av+1                      % //
   GOSUB sub1
  ENDIF
 ENDIF
 GR.BOUNDED.TOUCH swisom,0,sy*2/3,sx/3,sy
 IF swisom=1
  IF iso>1:iso=iso-1
   av=av-1
   GOSUB sub1
  ENDIF
 ENDIF
 !
 !                              % // text TV      //
 iso$=iso$[iso]
 IF sw>-1 
  IF tv=rtv THEN GR.COLOR 255,255/2,0,0,1
 ENDIF
 IF tv<1  THEN GR.TEXT.DRAW tx,sx/2,sy/3-dy,Tv$[1]
 IF tv>31 THEN GR.TEXT.DRAW tx,sx/2,sy/3-dy,Tv$[29]
 IF tv>0 & tv<32
  GR.TEXT.SIZE txz0
  GR.TEXT.ALIGN 1
  GR.TEXT.DRAW tx,0,dy,"Tv"
  IF tv<17
   GR.TEXT.DRAW tx,0,sy*3/12," 1/"
  ENDIF
  GR.TEXT.SIZE txz2
  GR.TEXT.ALIGN 2
  GR.TEXT.DRAW tx,sx/2,sy/3-dy,Tv$[tv]
 ENDIF
 GOSUB col
 !                              % // text AV      //
 IF sw>-1
  IF rav=av THEN GR.COLOR 255,255/2,0,0,1
 ENDIF
 IF av<1  THEN GR.TEXT.DRAW tx,sx/2,sy*2/3-dy,Av$[1]
 IF av>36 THEN GR.TEXT.DRAW tx,sx/2,sy*2/3-dy,Av$[36]
 IF av>0 & av<37
  av1=av
  GR.TEXT.SIZE txz0
  GR.TEXT.ALIGN 1
  GR.TEXT.DRAW tx,0,sy/2+dy/2,"Av"
  GR.TEXT.SIZE txz1
  GR.TEXT.ALIGN 2
  GR.TEXT.DRAW tx,sx/2,sy*2/3-dy,Av$[av1]
 ENDIF
 GOSUB col
 !                              % // text iso     //
 GR.TEXT.SIZE txz0
 GR.TEXT.ALIGN 1
 GR.TEXT.DRAW tx,0,sy-dy/3,"ISO"
 GR.TEXT.SIZE txz2
 GR.TEXT.ALIGN 2
 GR.TEXT.DRAW tx,sx/2,sy-dy,iso$
 !
 !                              % // Color switch //
 GR.BOUNDED.TOUCH t1,sx/3,sy*2/3,sx*2/3,sy
 IF t1
  insw=0
  sw=sw+1:IF sw=2 THEN sw=-3
  GR.CLOSE:GOTO m1
 ENDIF
 !
 GR.TEXT.SIZE txz0
 GR.TEXT.ALIGN 3
 IF dlg<>6
  GR.TEXT.DRAW tx,sx,sy/20,lv$[dlg]
 ELSE
  IF tv<31 & av1<35 & tv>1 & av>1 & iso>1 & iso<39
   GOSUB v0: GOSUB EV
  ENDIF
  GR.TEXT.DRAW tx,sx,sy/20,ev$+" Ev"
  GOSUB E_V
  GR.TEXT.SIZE sx/15
  GR.TEXT.DRAW tx,sx,sy-sy/100,e_v$+" lx"
 ENDIF
 GOSUB ln
 GR.RENDER
 !
UNTIL 0
!
ONERROR:
ONBACKKEY:
GOSUB fin
END
!
! // sub ///////////////////////////////////////////
!
values:
ARRAY.LOAD tv$[], "+", "32000","16000","8000","4000","2000","1000","500","250","125","60","30","15","8","4","2","1"+i$,"2"+i$,"4"+i$,"8"+i$,"15"+i$,"30"+i$,"1'","2'","4'","8'","15'","30'","1h","2h","-"
ARRAY.LOAD av$[], "-","0.5","0.6","0.7","0.8","1.0","1.2","1.4","1.7","2.0","2.4","2.8","3.4","4.0","4.8","5.6","6.7","8.0","9.5","11","13.5","16","19","22","27","32","38","44","54","64","76","88","108","128","152","+"
ARRAY.LOAD iso$[], "-","0.4","0.6","0.8","1.1","1.5","2.2","3","4.4","6","8.8","12.5","18","25","35","50","71","100","141","200","283","400","566","800","1131","1600","2263","3200","4526","6400","9051","12800","18102","25600","36204","51200","72408","102400","+"
RETURN
!
col:
IF sw=1 THEN GR.COLOR 255,30,30,30,1
IF sw=0 THEN GR.COLOR 255,180,180,180,1
IF sw=-1 THEN GR.COLOR 255,255,30,30,1
IF sw=-2 THEN GR.COLOR 255,30,255,30,1
IF sw=-3 THEN GR.COLOR 255,240,240,240,1
RETURN
!
ln:
GR.LINE l1,0,sy*1/3,sx,sy*1/3
GR.LINE l2,0,sy*2/3,sx,sy*2/3
GR.TEXT.ALIGN 1
GR.TEXT.DRAW tx,0,sy*1/6,"  -"
GR.TEXT.DRAW tx,0,sy*5/6,"  -"
GR.TEXT.ALIGN 3
GR.TEXT.DRAW tx,sx,sy*1/6,"+  "
GR.TEXT.DRAW tx,sx,sy*5/6,"+  "
RETURN
!
sub1:
PAUSE 100:GR.CLS
RETURN
!
inpt:
ARRAY.LOAD lv$[],m1$+" Sun",m2$+" Cloud",m3$+" Overcast",m4$+" Dawn",m5$+"  Indoors",m6$+" EV",m7$+" Calculate",_ex$+" Exit"
DIALOG.SELECT dlg, lv$[],_name$+" "+_ver$+" - ISO@100 …"
IF dlg=5:tv=13:av=12:iso=18:ENDIF
IF dlg=4:tv=13:av=14:iso=18:ENDIF
IF dlg=3:tv=11:av=16:iso=18:ENDIF
IF dlg=2:tv=10:av=18:iso=18:ENDIF
IF dlg=1:tv=10:av=20:iso=18:ENDIF
IF dlg=7
 IF tv<31 & av1<35 & tv>1 & av>1 & iso>1 & iso<39
  GOSUB v0
  GOSUB calc
 ENDIF
ENDIF
IF dlg=8:GOSUB fin:END:ENDIF
rtv=tv
rav=av
RETURN
!
calc:
GOSUB EV
ARRAY.LOAD calc$[],"Tv= 1/"+tv0$+" ("+tv1$+")s","Av: f "+av0$,"ISO= "+iso0$+"/"+din$+"°","Ev: "+ev$,"Ok"
DIALOG.SELECT dlg2, calc$[],m7$+" Calculate..."
IF dlg2=1
 INPUT "Tv=...",tv01,VAL(tv0$)
 GOSUB AvTv
 GOTO calc
ENDIF
IF dlg2=3
 INPUT "ISO=...",iso01,VAL(iso0$)
 GOSUB Aviso
 GOTO calc
ENDIF
IF dlg2=5 THEN GOTO inpt
RETURN
!
v0:                              % // conversions //
IF tv<17                         % // Tv < 1sec   //
 tv0$=Tv$[tv]
 tv1$=STR$(ROUND(1/VAL(tv0$),5))
ENDIF
IF tv>16                         % // Tv >= 1sec  //
 SW.BEGIN tv
  SW.CASE 17:tv0$="1":tv1$="1":SW.BREAK
  SW.CASE 18:tv0$="0.5":tv1$="2":SW.BREAK
  SW.CASE 19:tv0$="0.25":tv1$="4":SW.BREAK
  SW.CASE 20:tv0$="0.125":tv1$="8":SW.BREAK
  SW.CASE 21:tv0$="0.0667":tv1$="15":SW.BREAK
  SW.CASE 22:tv0$="0.0333":tv1$="30":SW.BREAK
  SW.CASE 23:tv0$="0.0167":tv1$="60":SW.BREAK
  SW.CASE 24:tv0$="0.0083":tv1$="120":SW.BREAK
  SW.CASE 25:tv0$="0.0042":tv1$="240":SW.BREAK
  SW.CASE 26:tv0$="0.0021":tv1$="480":SW.BREAK
  SW.CASE 27:tv0$="0.0011":tv1$="900":SW.BREAK
  SW.CASE 28:tv0$="0.00056":tv1$="1800":SW.BREAK
  SW.CASE 29:tv0$="0.00028":tv1$="3600":SW.BREAK
  SW.CASE 30:tv0$="0.00014":tv1$="7200":SW.BREAK
 SW.END
ENDIF
av0$=Av$[av1]
iso0$=iso$
din$=INT$(INT(10*LOG10(VAL(iso0$))+1)) % // DIN //
RETURN
!
AvTv:                             % // calc Av Tv //
av0$=STR$(VAL(av0$)*EXP((0.5*LOG(VAL(tv0$)/tv01))) )  
av0$=STR$(ROUND(VAL(av0$),2)) 
tv0$=STR$(tv01)
tv1$=STR$(ROUND(1/tv01,5))
RETURN
!
Aviso:                           % // calc Av iso //
av0$=STR$(VAL(av0$)*EXP((0.5*LOG(iso01/VAL(iso0$)))) ) 
av0$=STR$(ROUND(VAL(av0$),2)) 
iso0$=STR$(iso01)
din$=STR$(ROUND(10*LOG10(iso01)+1,1))
RETURN
!
EV:                                  % // calc Ev //
ev$=STR$(ROUND(1/LOG(2)*LOG((VAL(av0$))^2/(VAL(tv0$))^-1),2)) 
RETURN
!
E_V:                           % // calc E_V //
e_v$=STR$(ROUND(250*(2^VAL(ev$)/VAL(iso0$)),2))
RETURN
!
fin:
PRINT_name$+" Lightvalues "+_ver$
PRINT"Copyright "+_cr$+" 2025 by Dietmar Gerald Schrausser"
PRINT"https://github.com/Schrausser/LV"
RETURN
! // END //
! //
