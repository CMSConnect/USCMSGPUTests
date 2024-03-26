#! /bin/bash

# First, create a list of files
condor_status -pool vocms0207.cern.ch -any -const 'MyType=?="glidefactory" && GLIDEIN_Supported_VOs=?="CMSGPU" && regexp("_US_",GLIDEIN_CMSSite)' -af:h GLIDEIN_CMSSite  EntryName | tail -n +2 > site_entries.txt

res=$?
if [ $res != 0 ]; then
    echo "We were unable to retrieve site entries from the factory"
    exit 1
fi

# Now, do condor submission
condor_submit gpu.submit


