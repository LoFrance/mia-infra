terraform {

  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "lorenzopitntfst001"
    container_name       = "terraform-state"
    key                  = "plsm-dev.resources.tfstate"
    use_azuread_auth     = true
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  storage_use_azuread = true
}

data "azurerm_subscription" "current" {}

data "azurerm_client_config" "current" {}

module "runner" {
  source              = "../_modules/github_runner"
  environment         = local.environment
  resource_group_name = data.azurerm_resource_group.rg_common.name
  key_vault_pat_token = {
    name                = module.key_vaults.keyvault.name
    resource_group_name = data.azurerm_resource_group.rg_common.name
  }
  container_app_environment = {
    id       = module.container_apps.cae_details.id
    location = local.environment.location
  }
  depends_on = [
    module.key_vaults
  ]
  tags = local.tags
}
