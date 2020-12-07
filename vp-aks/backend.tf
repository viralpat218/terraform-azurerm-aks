terraform {
  backend "azurerm" {
    resource_group_name       =     "terraform-state"
    storage_account_name      =     "vpstatefile"
    container_name            =     "statefile"
    key                       =     "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  //client_id              = var.ARM_CLIENT_ID
  //client_secret          = var.ARM_CLIENT_SECRET
  //tenant_id              = var.ARM_TENANT_ID
  //subscription_id        = var.ARM_SUBSCRIPTION_ID
}