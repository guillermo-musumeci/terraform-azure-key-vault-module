####################
# common variables #
####################
environment = "development"
location    = "northeurope"

##################
# Authentication #
##################
azure-subscription-id = ""
azure-client-id       = ""
azure-client-secret   = ""
azure-tenant-id       = ""

#############
# key vault #
#############
kv-full-object-id =""
kv-read-object-id =""
kv-secrets = {
    sqldb = {
      value = "" # setting to "" will auto-generate the password
    }
    webadmin = {
      value = "hLDmexfL8@m46Suevb!oao"
    }
  }