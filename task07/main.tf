resource "azurerm_virtual_network" "vnet" {
  name                = "cmaz-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet" {
  name                 = "default"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# 2. KAYNAK VM (cmaz-12nxowyz-mod7-vm)
resource "azurerm_network_interface" "source_nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "source_vm" {
  name                            = var.vm_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  size                            = "Standard_B1s"
  admin_username                  = "azureuser"
  admin_password                  = "P@ssw0rd1234!"
  disable_password_authentication = false # Şifreyi aktif eder
  network_interface_ids           = [azurerm_network_interface.source_nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  # SSH ANAHTARI BLOĞU KALDIRILDI
}

# 3. RECOVERY SERVICES VAULT
resource "azurerm_recovery_services_vault" "rsv" {
  name                = var.rsv_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  soft_delete_enabled = false # TASK KRİTİK ŞARTI
}

# 4. STORAGE ACCOUNT
resource "azurerm_storage_account" "sa" {
  name                          = var.sa_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  account_tier                  = "Standard"
  account_replication_type      = "LRS"
  public_network_access_enabled = false
}

# 5. BACKUP POLICY
resource "azurerm_backup_policy_vm" "policy" {
  name                = "daily-backup"
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.rsv.name
  backup {
    frequency = "Daily"
    time      = "23:00"
  }
  retention_daily { count = 7 }
}

resource "azurerm_backup_protected_vm" "protected_vm" {
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.rsv.name
  source_vm_id        = azurerm_linux_virtual_machine.source_vm.id
  backup_policy_id    = azurerm_backup_policy_vm.policy.id
}

