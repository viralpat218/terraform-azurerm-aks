resource "random_id" "prefix" {
  byte_length = 8
}

resource "azurerm_resource_group" "aks" {
  location = var.location
  name = "${random_id.prefix.hex}-rg"
}

data "azurerm_subnet" "aks-subnet" {
  name                    =       var.aks-subnet-name
  virtual_network_name    =       var.vnet-name
  resource_group_name     =       var.aks-vnet-rg
}

data "azurerm_key_vault" "existing" {
  name                  =     var.keyvault-name
  resource_group_name   =     var.keyvault-rg
}

data "azurerm_key_vault_secret" "aks-id" {
  name                  =  var.aks-spn-id
  key_vault_id          =  data.azurerm_key_vault.existing.id
}

data "azurerm_key_vault_secret" "aks-pass" {
  name                  =  var.aks-spn-pass
  key_vault_id          =  data.azurerm_key_vault.existing.id
}

module aks {
    source                          = "../"
    prefix                          = "prefix-${random_id.prefix.hex}"
    resource_group_name             = azurerm_resource_group.aks.name
    client_id                       = data.azurerm_key_vault_secret.aks-id.value
    client_secret                   = data.azurerm_key_vault_secret.aks-pass.value
    vnet_subnet_id                  = data.azurerm_subnet.aks-subnet.id
    os_disk_size_gb                 = 60
    enable_azure_policy             = true
    sku_tier                        = "Paid"
    enable_kube_dashboard           = true
    depends_on                      = [azurerm_resource_group.aks]
}