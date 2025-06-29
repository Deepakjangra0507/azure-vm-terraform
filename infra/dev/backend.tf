# terraform {
#   backend "azurerm" {
#     resource_group_name  = "deepbackend"
#     storage_account_name = "deepakjstorage"
#     container_name       = "deepcontainer"
#     key                  = "dev.terraform.tfstate"
#   }
# }