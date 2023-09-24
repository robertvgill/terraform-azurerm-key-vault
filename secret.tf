## secret
resource "azurerm_key_vault_secret" "secret" {
  depends_on   = [azurerm_key_vault.kv]

  for_each     = var.kv_secrets
  key_vault_id = azurerm_key_vault.kv[0].id
  name         = format("%s", each.key)
  value        = lookup(each.value, "value") != "" ? lookup(each.value, "value") : random_password.password[each.key].result
  content_type = lookup(each.value, "content_type")

  lifecycle {
    ignore_changes = [key_vault_id]
  }

  tags = var.tags
}
