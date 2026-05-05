data "azurerm_client_config" "current" {}

resource "random_string" "suffix" {
  length  = 5
  upper   = false
  special = false
}

module "serviceprincipal" {
  source = "../modules/serviceprincipal"
  service_principal_name = var.service_principal_name
}

module "resourcegroup" {
  source = "../modules/resourcegroup"
  resource_group_name = "rg-bootstrap-${random_string.suffix.result}"
  location = var.location
}

# Assigning the Contributor role to the service principal at the subscription
resource "azurerm_role_assignment" "sp_role_assignment_contributor" {
  principal_id   = module.serviceprincipal.principal_id
  role_definition_name = "Contributor"
  scope = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"
}

# Assigning the Storage Blob Data Contributor role to the service principal at the subscription
resource "azurerm_role_assignment" "sp_role_assignment_storage_blob_data_contributor" {
  principal_id   = module.serviceprincipal.principal_id
  role_definition_name = "Storage Blob Data Contributor"
  scope = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"
}

# Assigning the User Access Administrator role to the service principal at the subscription
resource "azurerm_role_assignment" "sp_role_assignment_user_access_administrator" {
  principal_id   = module.serviceprincipal.principal_id
  role_definition_name = "User Access Administrator"
  scope = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"
}

module "keyvault" {
  source = "../modules/keyvault"
  location = module.resourcegroup.location
  resource_group_name = module.resourcegroup.resource_group_name
  keyvault_name = "kv-bootstrap-${random_string.suffix.result}"
}

# Assign the key vault secret officer role to the spn on the key vault to manage secrets
resource "azurerm_role_assignment" "kv_role_assignment" {
  principal_id   = module.serviceprincipal.principal_id
  role_definition_name = "Key Vault Secrets Officer"
  scope          = module.keyvault.keyvault_id
}

# Write the spn secret to the key vault
resource "azurerm_key_vault_secret" "kv_secret" {
  name = "spn-secret"
  value = module.serviceprincipal.client_secret
  key_vault_id = module.keyvault.keyvault_id
  depends_on = [ azurerm_role_assignment.kv_role_assignment ]
}