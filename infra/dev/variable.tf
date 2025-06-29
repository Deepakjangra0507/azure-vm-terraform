variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "my_resource_group"

}
variable "location" {
  description = "The Azure region where the resource group will be created"
  type        = string
  default     = "Central India"

}
variable "server_name" {
  description = "The name of the SQL server"
  type        = string
  default     = "deeserveradmin"

}
variable "administrator_login" {
  description = "The administrator login for the SQL server"
  type        = string
  default     = "sqladmin"

}
variable "administrator_login_password" {
  description = "The password for the SQL server administrator"
  type        = string
  default     = "P@ssw0rd1234"

}
variable "database_name" {
  description = "The name of the SQL database"
  type        = string
  default     = "my_database"

}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default     = "backendstoragedeepak"

}
variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "my_vnet"

}
variable "address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]

}
variable "address_prefixes" {
  description = "The address prefixes for the subnet"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}
variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "my_subnet"

}
variable "public_ip_name" {
  description = "The name of the public IP address"
  type        = string
  default     = "pip-todoapp-frontend"

}
variable "network_interface_name" {
  description = "The name of the network interface"
  type        = string
  default     = "my_network_interface"

}
variable "key_vault_name" {
  description = "The name of the Key Vault"
  type        = string
  default     = "vmdeepjangra"
}
variable "server_secret_name" {
  description = "The name of the Key Vault secret for the subnet"
  type        = string
  default     = "subnet-secret"
}
variable "server_secret_value" {
  description = "The value of the Key Vault secret for the subnet"
  type        = string
  default     = "subnet-secret-value"
}
variable "server_password_secret_name" {
  description = "The name of the Key Vault secret for the subnet password"
  type        = string
  default     = "usernamesecret"
}
variable "server_password_secret_value" {
  description = "The value of the Key Vault secret for the subnet password"
  type        = string
  default     = "P@ssw0rd1234!"
}
variable "vm_user_secret_name" {
  description = "The name of the Key Vault secret for the VM user"
  type        = string
  default     = "vm-username"
}
variable "vm_user_secret_value" {
  description = "The value of the Key Vault secret for the VM user"
  type        = string
  default     = "adminuser"
}
variable "vm_password_secret_name" {
  description = "The name of the Key Vault secret for the VM password"
  type        = string
  default     = "vm-password"
}
variable "vm_password_secret_value" {
  description = "The value of the Key Vault secret for the VM password"
  type        = string
  default     = "P@ssw0rd1234!"
}
variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
  default     = "my-vm-frontend"
}

  

