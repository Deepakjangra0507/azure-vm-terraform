module "rg_name" {
  source   = "../../modules/azurerm_resource_group"
  rg_name  = var.resource_group_name
  location = var.location

}
module "azurerm_virtual_network" {
  depends_on    = [module.rg_name]
  source        = "../../modules/azurerm_virtual_network"
  vnet_name     = var.vnet_name
  address_space = var.address_space
  rg_name       = var.resource_group_name
  location      = var.location

}
module "subnet" {
  depends_on       = [module.azurerm_virtual_network]
  source           = "../../modules/azurerm_subnet"
  subnet_name      = var.subnet_name
  vnet_name        = var.vnet_name
  address_prefixes = var.address_prefixes
  rg_name          = var.resource_group_name

}
module "public_ip" {
  depends_on     = [module.rg_name]
  source         = "../../modules/azurerm_public_ip"
  public_ip_name = var.public_ip_name
  rg_name        = var.resource_group_name
  location       = var.location

}
module "nic" {
  depends_on             = [module.rg_name, module.subnet, module.public_ip]
  source                 = "../../modules/azurerm_network_interface"
  network_interface_name = var.network_interface_name
  rg_name                = var.resource_group_name
  location               = var.location
  subnet_name            = var.subnet_name
  vnet_name              = var.vnet_name
  public_ip_name         = var.public_ip_name
}

module "sql_server" {
  depends_on                   = [module.rg_name, module.azurerm_key_vault]
  source                       = "../../modules/azurerm_sql_server"
  server_name                  = var.server_name
  rg_name                      = var.resource_group_name
  location                     = var.location
  key_vault_name               = var.key_vault_name
  server_user_secret_name      = var.server_secret_name
  server_password_secret_name  = var.server_password_secret_name

}
module "azurerm_sql_database" {
  depends_on    = [module.sql_server]
  source        = "../../modules/azurerm_sql_database"
  database_name = var.database_name
  rg_name       = var.resource_group_name
  server_name   = var.server_name

}
module "storage_account" {
  depends_on           = [module.rg_name]
  source               = "../../modules/azurerm_storage_account"
  storage_account_name = var.storage_account_name
  rg_name              = var.resource_group_name
  location             = var.location

}
module "azurerm_key_vault" {
  depends_on     = [module.rg_name]
  source         = "../../modules/azurerm_key_vault"
  key_vault_name = var.key_vault_name
  rg_name        = var.resource_group_name
  location       = var.location


}
module "server_username" {
  depends_on     = [module.azurerm_key_vault]
  source         = "../../modules/azurerm_key_vault_secret"
  key_vault_name = var.key_vault_name
  rg_name        = var.resource_group_name
  secret_name    = var.server_secret_name
  secret_value   = var.server_secret_value

}
module "server_password" {
  depends_on     = [module.azurerm_key_vault]
  source         = "../../modules/azurerm_key_vault_secret"
  key_vault_name = var.key_vault_name
  rg_name        = var.resource_group_name
  secret_name    = var.server_password_secret_name
  secret_value   = var.server_password_secret_value

}
module "vm_username" {
  depends_on     = [module.azurerm_key_vault]
  source         = "../../modules/azurerm_key_vault_secret"
  key_vault_name = var.key_vault_name
  rg_name        = var.resource_group_name
  secret_name    = var.vm_user_secret_name
  secret_value   = var.vm_user_secret_value

}
module "vm_password" {
  depends_on     = [module.azurerm_key_vault]
  source         = "../../modules/azurerm_key_vault_secret"
  key_vault_name = var.key_vault_name
  rg_name        = var.resource_group_name
  secret_name    = var.vm_password_secret_name
  secret_value   = var.vm_password_secret_value

}
module "azurerm_linux_virtual_machine" {
  depends_on              = [module.nic, module.server_username, module.server_password, module.vm_username, module.vm_password]
  source                  = "../../modules/azurerm_linux_virtual_machine"
  network_interface_name  = var.network_interface_name
  location                = var.location
  rg_name                 = var.resource_group_name
  vm_name                 = var.vm_name
  key_vault_name          = var.key_vault_name
  vm_user_secret_name     = var.vm_user_secret_name
  vm_password_secret_name = var.vm_password_secret_name


}