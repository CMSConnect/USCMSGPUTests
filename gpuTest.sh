#! /bin/bash

hostname
date
pwd
command -v nvidia-smi
if [ $? == 0 ]; then
    nvidia-smi
fi

echo -- cat .job.ad
cat .job.ad

echo -- cat .machine.ad
cat .machine.ad

sleep 3600
