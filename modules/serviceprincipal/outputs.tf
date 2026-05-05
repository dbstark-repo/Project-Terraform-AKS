
output "sp_name" {
  description = "Service Principal Name"
  value = azuread_service_principal.sp.display_name
}

output "principal_id" {
  description = "Service Principal Object Id"
  value = azuread_service_principal.sp.object_id
}

output "tenant_id" {
  description = "Tenant Id"
  value = azuread_service_principal.sp.application_tenant_id
}

output "client_id" {
  description = "Service Principal App Client Id"
  value = azuread_application.app.client_id
}

output "client_secret" {
  description = "Service Principal Client Secret"
  value = azuread_service_principal_password.sp_password.value
}