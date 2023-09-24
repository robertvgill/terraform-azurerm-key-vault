variable "tenant_id" {
description = "The Tenant ID should be used."
type        = string
}

variable "client_id" {
description = "The Client ID which should be used."
type        = string
}

## resource group
variable "rg_resource_group_name" {
  description = "The name of the resource group in which to create the storage account."
  type        = string
}

variable "rg_location" {
  description = "Specifies the supported Azure location where the resource should be created."
  type        = string
}

## key vault
variable "kv_key_vault_create" {
  description = "Controls if key vault should be created."
  type        = bool
}

variable "kv_key_vault_name" {
  description = "The name of the Azure Key Vault."
  type        = string
}

variable "kv_sku_name" {
  description = "Select Standard or Premium SKU."
  type        = string
}

variable "kv_enabled_for_deployment" {
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault."
  type        = string
}

variable "kv_enabled_for_disk_encryption" {
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys."
  type        = string
}

variable "kv_enabled_for_template_deployment" {
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault."
  type        = string
}

variable "kv_soft_delete_retention_days" {
  description = "The number of days that items should be retained for once soft-deleted."
  type        = number
}

variable "kv_purge_protection_enabled" {
  description = "Is Purge Protection enabled for this Key Vault? Defaults to false"
  type        = bool
}

variable "kv_network_acls" {
  description = ""
  type = object({
    default_action = string
    bypass         = string
  })
}

variable "kv_key_permissions_full" {
  description = "List of full key permissions, must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify and WrapKey."
  type        = list(string)
}

variable "kv_secret_permissions_full" {
  description = "List of full secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set"
  type        = list(string)
}

variable "kv_certificate_permissions_full" {
  description = "List of full certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update"
  type        = list(string)
}

variable "kv_storage_permissions_full" {
  description = "List of full storage permissions, must be one or more from the following: Backup, Delete, DeleteSAS, Get, GetSAS, List, ListSAS, Purge, Recover, RegenerateKey, Restore, Set, SetSAS and Update."
  type        = list(string)
}

variable "kv_key_permissions_read" {
  description = "List of read key permissions, must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify and wrapKey"
  type        = list(string)
}

variable "kv_secret_permissions_read" {
  description = "List of full secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set."
  type        = list(string)
}

variable "kv_certificate_permissions_read" {
  description = "List of full certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update."
  type        = list(string)
}

variable "kv_storage_permissions_read" {
  description = "List of read storage permissions, must be one or more from the following: Backup, Delete, DeleteSAS, Get, GetsAs, List, ListsAs, Purge, Recover, RegenerateKey, Restore, Set, SetsAs and Update."
  type        = list(string)
}

variable "kv_policies" {
  description = "Define a Azure Key Vault access policy"
  type = map(object({
    tenant_id               = string
    object_id               = string
    key_permissions         = list(string)
    secret_permissions      = list(string)
    certificate_permissions = list(string)
    storage_permissions     = list(string)
  }))
}

variable "kv_secrets" {
  description = "Define Azure Key Vault secrets."
  type = map(object({
    value = string
    content_type = string
  }))
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}
