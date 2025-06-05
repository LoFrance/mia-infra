# data "azurerm_key_vault" "plsm-kv" {
#   name                = "kv-plsm"
#   resource_group_name = "${local.project}-${local.domain}-rg-01"
# }
# plsm-d-itn-plsm-rg-01



data "azurerm_resource_group" "rg_common" {
  name = "plsm-d-rg-common-test"
}
