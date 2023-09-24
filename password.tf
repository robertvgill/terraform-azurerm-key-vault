resource "random_password" "password" {
depends_on = [
  azurerm_key_vault.kv,
  azurerm_key_vault_access_policy.default_policy,
]

  for_each    = var.kv_secrets
  length      = 20
  min_upper   = 2
  min_lower   = 2
  min_numeric = 2
  min_special = 2

  keepers = {
    name = each.key
  }
}
