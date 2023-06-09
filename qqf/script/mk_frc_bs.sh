#!/bin/bash

DIR=`pwd`

kmo=3
navg=3

khpr=1
hamp=0.00001
xdil=6.
ydil=6.
xcnt=102.
ycnt=30.

kvpr=2
vamp=1.
vdil=20.
vcnt=0.2

ovor=t
odiv=f
otmp=f
ops=f
osph=f

cd ../../solver/util/

[[ -f SETPAR ]] && rm -rf SETPAR

home=/home/qqf/Model/LBM

cat > ./SETPAR  << SETPAR 
 &nmfgt cfs='${home}/qqf/Gtools/psi',
        cfc='${home}/qqf/Gtools/chi',
        cfu='${home}/qqf/Gtools/u',
        cfv='${home}/qqf/Gtools/v',
        cfw='${home}/qqf/Gtools/w',
        cft='${home}/qqf/Gtools/t',
        cfz='${home}/qqf/Gtools/z',
        cfp='${home}/qqf/Gtools/p',
        cfq='${home}/qqf/Gtools/q',
        cfx='${home}/qqf/Gtools/dt',
        cfy='${home}/qqf/Gtools/dq',
        cfo='${home}/qqf/out/linear.t42l20.qqf.grd',
        fact=1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,
        opl=t,
 &end

 &nmbs  cbs0='${home}/qqf/bs/qqf.t42l20',
        cbs='${home}/qqf/bs/qqf.t42l20.grd'
 &end

 &nmncp cncep='${home}/qqf/mybs/ncep.clim.y79-14.t42.grd',
        cncep2='${home}/qqf/mybs/ncep.clim.y79-14.ps.t42.grd',
        calt='${home}/bs/gt3/grz.t42',
        kmo=$kmo, navg=$navg, ozm=f, osw=f, ousez=t
 &end

 &nmecm cecm='${home}/bs/ecmwf/ERA40.clim.t42.grd',
        calt='${home}/bs/gt3/grz.t42',
        kmo=6, navg=3, ozm=f, osw=f
 &end

 &nmfin cfm='${home}/qqf/frc/frc.t42l20.CNP.mat',
        cfg='${home}/qqf/frc/frc.t42l20.CNP.grd'
        fact=1.0,1.0,1.0,1.0,1.0
 &end

 &nmvar ovor=$ovor, odiv=$odiv, otmp=$otmp, ops=$ops, osph=$osph
 &end

 &nmhpr khpr=$khpr,
        hamp=$hamp,
        xdil=$xdil,
        ydil=$ydil,
        xcnt=$xcnt,
        ycnt=$ycnt
 &end

 &nmvpr kvpr=$kvpr,
        vamp=$vamp,
        vdil=$vdil,
        vcnt=$vcnt
 &end

 &nmall owall=t
 &end

 &nmcls oclassic=t
 &end


 &nmred cdr='${home}/matrix.moi',
        cfo='${home}/matrix.moi/mat/MAT.t21l11m6.ncepannzm.moi.tmp.dat'
 &end
SETPAR

rm -rf fort.*

./ncepsbs #>& /dev/null

rm -rf fort.*

./mkfrcng #>& /dev/null

rm -rf fort.*

cd $DIR
