# outputs for user assigned identity module

output "user_assigned_identity_id" {
  description = "The ID of the user assigned identity."
  value       = azurerm_user_assigned_identity.mi.id
}

output "user_assigned_app_id" {
  description = "The client ID of the app associated with the user assigned identity."
  value       = azurerm_user_assigned_identity.mi.client_id
}

output "user_assigned_app_principal_id" {
  description = "The ID of the service principal object associated with the user assigned identity."
  value       = azurerm_user_assigned_identity.mi.principal_id
}

output "tenant_id" {
  description = "The tenant ID of the user assigned identity."
  value       = azurerm_user_assigned_identity.mi.tenant_id
}
