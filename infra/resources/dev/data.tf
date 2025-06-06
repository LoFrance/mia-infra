# data "azurerm_key_vault" "plsm-kv" {
#   name                = "kv-plsm"
#   resource_group_name = "${local.project}-${local.domain}-rg-01"
# }
# plsm-d-itn-plsm-rg-01



data "azurerm_resource_group" "rg_common" {
  name = "plsm-d-rg-common-test"
}

data "azurerm_container_registry" "acr" {
  name                = "acrlorenzo"
  resource_group_name = "plsm-p-itn-core-rg"
}


data "azuread_group" "admins" {
  display_name = local.adgroups.admins_name
}

# data "azuread_group" "devs" {
#   display_name = local.adgroups.devs_name
# }
