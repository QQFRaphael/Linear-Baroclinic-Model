#!/bin/bash

LNHOME=/home/qqf/Model/LBM

home=`echo ${LNHOME}|sed 's/\//\\\\\//g'`

sed -i "10s/^.*.$/setenv LNHOME ${home}         # ROOT of model/g" compile.csh
sed -i "10s/^.*.$/setenv LNHOME   ${home}                  # ROOT of model/g" t42-run.csh
sed -i "30s/^.*.$/home=${home}/g" mk_frc_bs.sh
sed -i "3s/^.*.$/LNHOME=${home}/g" run_all.sh

chmod u+x * ../bs/convert.sh ../frc/convert.sh ../out/convert.sh
