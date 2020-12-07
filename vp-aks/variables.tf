variable "aks-vnet-rg" {
  default = "vp-virtualnet"
}

variable "vnet-name" {
  default = "vp-aks"
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

variable "aks-subnet-name" {
}

variable "service_cidr" {
  default = "10.0.8.0/24"
}

variable "client_app_id" {
  default = "client-server-id"
}

variable "server_app_id" {
  default = "aks-server-id"
}

variable "server_app_secret" {
  default = "aks-server-secret"
}

variable "ARM_CLIENT_ID" {}

variable "ARM_CLIENT_SECRET" {}

variable "ARM_TENANT_ID" {}

variable "ARM_SUBSCRIPTION_ID" {}