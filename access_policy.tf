## access policy
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault_access_policy" "default_policy" {
  depends_on = [azurerm_key_vault.kv]

  key_vault_id = azurerm_key_vault.kv[0].id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  lifecycle {
    create_before_destroy = true
  }

  key_permissions         = var.kv_key_permissions_full
  secret_permissions      = var.kv_secret_permissions_full
  certificate_permissions = var.kv_certificate_permissions_full
  storage_permissions     = var.kv_storage_permissions_full
}
