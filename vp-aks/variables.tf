variable "aks-vnet-rg" {
  default = "vp-virtualnet"
}

variable "vnet-name" {
  default = "vp-net"
}

variable "aks-spn-id" {
  default = "aks-id"
}

variable "aks-spn-pass" {
  default = "aks-pass"
}

variable "keyvault-name" {
  default = "vptest01"
}

variable "keyvault-rg" {
  default = "VP-KV"
}

variable "ARM_CLIENT_ID" {}

variable "ARM_CLIENT_SECRET" {}

variable "ARM_TENANT_ID" {}

variable "ARM_SUBSCRIPTION_ID" {}