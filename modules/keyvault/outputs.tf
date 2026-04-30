# outputs for key vault module

output "keyvault_id" {
  description = "Key vault id"
  value       = azurerm_key_vault.kv.id
}