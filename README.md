# USCMSGPUTests
This is a set of submission scripts to run periodically to validate GPU usage of resources within USCMS in the CMS Global Pool through CMS Connect

# Getting the list of CEs

$ condor_status -pool vocms0207.cern.ch -any -const 'MyType=?="glidefactory" && GLIDEIN_Supported_VOs=?="CMSGPU" && regexp("_US_",GLIDEIN_CMSSite)' -af:h GLIDEIN_CMSSite  EntryName | tail -n +2 > site_entries.txt
$ condor_status -pool gfactory-2.opensciencegrid.org -any -const 'MyType=?="glidefactory" && GLIDEIN_Supported_VOs=?="CMSGPU" && regexp("_US_",GLIDEIN_CMSSite)' -af:h GLIDEIN_CMSSite  EntryName | tail -n +2 > site_entries.txt
