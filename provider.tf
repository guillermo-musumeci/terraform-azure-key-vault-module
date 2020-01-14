# define terraform provider
terraform {
  required_version = ">= 0.12"
}

# configure the azure provider
provider "azurerm" { 
  environment     = "public"
  subscription_id = var.azure-subscription-id
  client_id       = var.azure-client-id
  client_secret   = var.azure-client-secret
  tenant_id       = var.azure-tenant-id
}
