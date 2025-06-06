module "container_apps" {
  source = "../_modules/container_apps"

  environment         = local.environment
  resource_group_name = azurerm_resource_group.itn_com.name

  virtual_network = azurerm_virtual_network.vnet-common-itn

  subnet_cidr = "10.10.3.0/24"

  subnet_pep_id                        = azurerm_subnet.subnet_pep.id
  private_dns_zone_resource_group_name = azurerm_resource_group.itn_com.name


  log_analytics_workspace_id = azurerm_log_analytics_workspace.common.id

  key_vault_id = module.key_vaults.keyvault.id

  acr_id = data.azurerm_container_registry.acr.id

  tenant_id = data.azurerm_client_config.current.tenant_id

  entra_id_admin_ids = [
    data.azuread_group.admins.object_id,
    # data.azuread_group.devs.object_id,
  ]

  tags = local.tags

  depends_on = [
    azurerm_virtual_network.vnet-common-itn,
    azurerm_subnet.web,
    azurerm_subnet.subnet_pep,
    azurerm_private_dns_zone.container_apps
  ]
}
