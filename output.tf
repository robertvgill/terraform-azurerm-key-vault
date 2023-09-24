## key vault
output "kv_key_vault_name" {
  description = "The name of the key vault."
  value       = var.kv_key_vault_create ? element(concat(azurerm_key_vault.kv[*].name, tolist([""])), 0) : 0
}
