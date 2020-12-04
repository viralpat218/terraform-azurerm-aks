resource "random_id" "prefix" {
  byte_length = 8
}

resource "azurerm_resource_group" "aks" {
  location = var.location
  name = "${random_id.prefix.hex}-rg"
}

resource "azurerm_virtual_network" "vp-net" {
  address_space = ["10.0.0.0/8"]
  location = var.location
  name = var.vnet-name
  resource_group_name = var.aks-vnet-rg
}

resource "azurerm_subnet" "aks-subnet" {
  name = "aks"
  resource_group_name = var.aks-vnet-rg
  virtual_network_name = azurerm_virtual_network.vp-net.name
  address_prefixes = ["10.0.7.0/24"]
}

module "aks" {
  source                              = "../.."
  prefix                              = "prefix-${random_id.prefix.hex}"
  resource_group_name                 = azurerm_resource_group.aks.name
  client_id                           = var.client_id
  client_secret                       = var.client_secret
  vnet_subnet_id                      = azurerm_subnet.aks-subnet.id
  os_disk_size_gb                     = 60
  enable_azure_policy                 = true
  sku_tier                            = "Paid"
  enable_kube_dashboard               = true
  depends_on                          = [azurerm_resource_group.aks]

}