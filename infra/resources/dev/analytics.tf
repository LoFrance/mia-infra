resource "azurerm_log_analytics_workspace" "common" {
  name                = "${local.project}-${local.domain}-log-common"
  location            = data.azurerm_resource_group.rg_common.location
  resource_group_name = data.azurerm_resource_group.rg_common.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}
