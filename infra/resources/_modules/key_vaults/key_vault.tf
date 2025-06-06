
# resource "azurerm_key_vault" "keyvault" {
#   name                = "${var.project}-core-kv-01"
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   tenant_id           = var.tenant_id
#   sku_name            = "standard"

#   enabled_for_disk_encryption   = true
#   enable_rbac_authorization     = true
#   soft_delete_retention_days    = 90
#   purge_protection_enabled      = true
#   public_network_access_enabled = true

#   network_acls {
#     bypass         = "AzureServices"
#     default_action = "Allow" #tfsec:ignore:AZU020
#   }

#   tags = var.tags
# }

resource "azurerm_key_vault" "plsm-kv" {
  name = provider::dx::resource_name(merge(var.environment, { resource_type = "key_vault", instance_number = 1 }))

  location                 = var.environment.location
  resource_group_name      = var.resource_group_name
  tenant_id                = var.tenant_id
  purge_protection_enabled = false

  tags = var.tags

  sku_name = "standard"

  enable_rbac_authorization = true

}