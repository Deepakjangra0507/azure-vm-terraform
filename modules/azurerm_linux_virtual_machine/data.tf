data "azurerm_network_interface" "nic" {
  name                = var.network_interface_name
  resource_group_name = var.rg_name
}
data "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  resource_group_name = var.rg_name
}

data "azurerm_key_vault_secret" "vm-username" {
  name         = var.vm_user_secret_name
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "vm-password" {
  name         = var.vm_password_secret_name
  key_vault_id = data.azurerm_key_vault.kv.id
}