resource "azurerm_virtual_network" "vnet-common-itn" {
  name                = "vnet-common-itn"
  address_space       = ["10.10.0.0/16"]
  location            = azurerm_resource_group.itn_com.location
  resource_group_name = azurerm_resource_group.itn_com.name
}

resource "azurerm_subnet" "subnet_pep" {
  name                 = "subnet-pep"
  resource_group_name  = azurerm_resource_group.itn_com.name
  virtual_network_name = azurerm_virtual_network.vnet-common-itn.name
  address_prefixes     = ["10.10.1.0/24"]
}

resource "azurerm_subnet" "web" {
  name                 = "snet-web"
  resource_group_name  = azurerm_resource_group.itn_com.name
  virtual_network_name = azurerm_virtual_network.vnet-common-itn.name
  address_prefixes     = ["10.10.3.0/24"]
}

resource "azurerm_subnet" "container_app" {
  name                 = "container-app"
  resource_group_name  = azurerm_resource_group.itn_com.name
  virtual_network_name = azurerm_virtual_network.vnet-common-itn.name
  address_prefixes     = ["10.10.4.0/24"]
}

resource "azurerm_subnet" "postgres" {
  name                 = "snet-postgres"
  resource_group_name  = azurerm_resource_group.itn_com.name
  virtual_network_name = azurerm_virtual_network.vnet-common-itn.name
  address_prefixes     = ["10.10.2.0/24"]
}

resource "azurerm_private_dns_zone" "privatelink_postgres" {
  name                = "privatelink.postgres.database.azure.com"
  resource_group_name = azurerm_resource_group.itn_com.name
}

resource "azurerm_private_dns_zone" "privatelink_webapp" {
  name                = "privatelink.azurewebsites.net"
  resource_group_name = azurerm_resource_group.itn_com.name
}

locals {
  dns_zones = {
    postgres = azurerm_private_dns_zone.privatelink_postgres.name
    webapp   = azurerm_private_dns_zone.privatelink_webapp.name
  }
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns_links" {
  for_each = local.dns_zones

  name                  = "vnet-link-${each.key}"
  resource_group_name   = azurerm_resource_group.itn_com.name
  private_dns_zone_name = each.value
  virtual_network_id    = azurerm_virtual_network.vnet-common-itn.id
}


resource "azurerm_private_dns_zone" "container_apps" {
  name                = "privatelink.italynorth.azurecontainerapps.io"
  resource_group_name = azurerm_resource_group.itn_com.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "container_apps" {
  name                  = "vnet-link-container-apps"
  resource_group_name   = azurerm_resource_group.itn_com.name
  private_dns_zone_name = azurerm_private_dns_zone.container_apps.name
  virtual_network_id    = azurerm_virtual_network.vnet-common-itn.id
}