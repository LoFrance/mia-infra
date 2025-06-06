output "keyvault" {
  value = {
    name = azurerm_key_vault.plsm-kv.name
    id   = azurerm_key_vault.plsm-kv.id
  }
}
