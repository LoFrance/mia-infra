# Resource Group Network
resource "azurerm_resource_group" "itn_com" {
  name     = "${local.project}-${local.domain}-rg-01"
  location = local.location
}
# plsm-d-itn-plsm-rg-01