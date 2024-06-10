#! /bin/bash

# Specify keyless user cert to use
# $1=hostcert
# $2=hostkey

workDir=/connectuser/monitoring/USCMSGPUTests
cd $workDir
script=submit_gpu_tests.sh

source  /cvmfs/oasis.opensciencegrid.org/mis/osg-wn-client/3.6/current/el7-x86_64/setup.sh
voms-proxy-init -voms cms -cert "$1" -key "$2" -out $workDir/tmp.proxy
proxy=$workDir/tmp.proxy

X509_USER_PROXY=$proxy sh $script
rm $proxy

