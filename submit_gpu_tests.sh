#! /bin/bash

# First, create a list of files for all USCMS GPU gatekeepers
# Note: The classad GLIDEIN_Gatekeeper is composed of 2 strings with a space between them
# E.g.: cit-gatekeeper2.ultralight.org cit-gatekeeper2.ultralight.org:9619
# The GWMS frontend won't match against the whole string (because the space splits both strings in two in their matching expression)
# but it works if only one of the sub-strings is provided. Let's use the first, as recommended by the SI team
condor_status -pool vocms0207.cern.ch -any -const 'MyType=?="glidefactory" && GLIDEIN_Supported_VOs=?="CMSGPU" && regexp("_US_",GLIDEIN_CMSSite)' -af GLIDEIN_Gatekeeper | awk '{print $1}' > site_gatekeepers.txt
#condor_status -pool vocms0207.cern.ch -any -const 'MyType=?="glidefactory" && GLIDEIN_Supported_VOs=?="CMSGPU" && regexp("_US_",GLIDEIN_CMSSite)' -af GLIDEIN_Gatekeeper > site_gatekeepers.txt

# We can also submit at the site level
#condor_status -pool vocms0207.cern.ch -any -const 'MyType=?="glidefactory" && GLIDEIN_Supported_VOs=?="CMSGPU" && regexp("_US_",GLIDEIN_CMSSite)' -af GLIDEIN_CMSSite > sites.txt

res=$?
if [ $res != 0 ]; then
    echo "We were unable to retrieve site entries from the factory"
    exit 1
fi

# Now, do condor submission
condor_submit gpu_siteGatekeepers.submit
# site level
#condor_submit gpu_sites.submit
