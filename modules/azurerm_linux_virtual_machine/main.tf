

resource "azurerm_linux_virtual_machine" "vm-frontend" {
  name                = var.vm_name
  resource_group_name = var.rg_name
  location            = var.location
  size                = "Standard_B1s"
  network_interface_ids = [data.azurerm_network_interface.nic.id]
  admin_username                  = data.azurerm_key_vault_secret.vm-username.value
  admin_password                  = data.azurerm_key_vault_secret.vm-password.value
    disable_password_authentication = "false"
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
    custom_data = base64encode(<<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y nginx
    systemctl enable nginx
    systemctl start nginx
  EOF
  )
}
