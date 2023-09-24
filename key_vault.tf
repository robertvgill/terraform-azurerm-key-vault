## key vault
resource "azurerm_key_vault" "kv" {
  count = var.kv_key_vault_create ? 1 : 0

  location                        = var.rg_location
  resource_group_name             = var.rg_resource_group_name

  name                            = format("%s", var.kv_key_vault_name)
  tenant_id                       = var.tenant_id
  sku_name                        = var.kv_sku_name

  enabled_for_deployment          = var.kv_enabled_for_deployment
  enabled_for_disk_encryption     = var.kv_enabled_for_disk_encryption
  enabled_for_template_deployment = var.kv_enabled_for_template_deployment

  soft_delete_retention_days      = var.kv_soft_delete_retention_days
  purge_protection_enabled        = var.kv_purge_protection_enabled

  network_acls {
    default_action = var.kv_network_acls.default_action
    bypass         = var.kv_network_acls.bypass
  }

  tags     = merge({ "ResourceName" = format("%s", var.kv_key_vault_name) }, var.tags, )
}
