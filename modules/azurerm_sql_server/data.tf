data "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  resource_group_name = var.rg_name
}

data "azurerm_key_vault_secret" "server-username" {
  name         = var.server_user_secret_name
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "server-password" {
  name         = var.server_password_secret_name
  key_vault_id = data.azurerm_key_vault.kv.id
}