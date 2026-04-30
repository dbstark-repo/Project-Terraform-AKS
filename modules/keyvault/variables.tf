variable "resource_group_name" {
  description = "Key vault resource group name"
  type = string
}

variable "location" {
  description = "Key vault resource group location"
  type = string
}

variable "keyvault_name" {
  description = "Key vault name"
  type = string
}

# variable "service_principal_name" {
#   type = string
#   description = "Name of the service principal to be granted access to the key vault"
# }

# variable "service_principal_id" {
#   type = string
#   description = "Object ID of the service principal to be granted access to the key vault"
# }

# variable "tenant_id" {
#   type = string
#   description = "Tenant ID"
# }