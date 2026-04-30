output "tenant_id" {
  value = module.serviceprincipal.tenant_id
}

output "client_id" {
  value = module.serviceprincipal.client_id
}

output "principal_id" {
  value = module.serviceprincipal.principal_id
}

output "client_secret" {
  value = module.serviceprincipal.client_secret
  sensitive = true
}

