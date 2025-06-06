locals {
  full_prefix    = "plsm"
  prefix         = "sm"
  module_prefix  = substr(local.full_prefix, 2, 2)
  env_short      = "d"
  location_short = "itn"
  domain         = "plsm"
  # the project on which the resources will be created
  # it's the prefix of any resource name
  # it includes the choosen location
  project = "${local.prefix}-${local.env_short}-${local.location_short}"
  # "plsm-d-itn-plsm"


  location = "italynorth"
  env      = "dev"

  instance_number = "01"

  # some referenced resources are in a different location
  # for historical reasons
  # this project points to them (westeurope)
  project_legacy = "${local.prefix}-${local.env_short}"

  environment = {
    prefix    = local.prefix
    env_short = local.env_short
    location  = local.location
    domain    = local.domain
  }

  # adgroups = {
  #   admins_name = "plsm-p-adgroup-admin"
  #   devs_name   = "plsm-p-adgroup-developers"
  # }

  adgroups = {
    admins_name = "admins"
  }
  tags = {
    CostCenter     = "TS310 - PAGAMENTI & SERVIZI"
    CreatedBy      = "Terraform"
    Environment    = "Dev"
    Owner          = "LoFrance"
    ManagementTeam = "Lorenzo Team"
    Source         = "https://github.com/lofrance/mia-infra/blob/master/infra/identity/dev"
  }


}
