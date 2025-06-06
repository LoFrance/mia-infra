
variable "environment" {
  type = object({
    prefix    = string
    env_short = string
    location  = string
    domain    = string
  })

  description = "Values which are used to generate resource names and location short names. They are all mandatory except for domain, which should not be used only in the case of a resource used by multiple domains."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "tags" {
  type        = map(any)
  description = "Resources tags"
}

# variable "cidr_subnet" {
#   type        = string
#   description = "Container App Environment network address space"
# }

# variable "vnet_common" {
#   type = object({
#     id                  = string
#     name                = string
#     resource_group_name = string
#   })
#   description = "Information of the common VNet"
# }

# variable "log_analytics_workspace_id" {
#   type        = string
#   description = "Id of the Log Analytics Workspace to use as log database"
# }

variable "key_vault_pat_token" {
  type = object({
    name                = string
    resource_group_name = string
  })
}


variable "container_app_environment" {
  type = object({
    id       = string
    location = string
  })
  description = "Information of the Container App"
}
