module "container_app_github_runner" {
  source  = "pagopa-dx/github-selfhosted-runner-on-container-app-jobs/azurerm"
  version = "~> 1.0"

  environment = {
    prefix          = var.environment.prefix
    env_short       = var.environment.env_short
    location        = var.environment.location
    instance_number = "01"
  }

  resource_group_name = var.resource_group_name

  container_app_environment = {
    id                          = var.container_app_environment.id
    location                    = var.container_app_environment.location
    replica_timeout_in_seconds  = 10800
    polling_interval_in_seconds = 20
    cpu                         = 1
    memory                      = "2Gi"
  }

  key_vault = {
    name                = var.key_vault_pat_token.name
    resource_group_name = var.key_vault_pat_token.resource_group_name
  }

  repository = {
    name = "io-infra"
  }

  tags = var.tags
}
