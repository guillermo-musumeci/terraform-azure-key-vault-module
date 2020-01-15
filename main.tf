##################
# resource group #
##################

# Create a resource group for security
resource "azurerm_resource_group" "security-rg" {
  name     = "security-${var.environment}-rg"
  location = var.location
}

#############
# key vault #
#############

module "keyvault" {
  source              = "./modules/keyvault"
  name                = "${var.environment}-keyvault"
  location            = azurerm_resource_group.security-rg.location
  resource_group_name = azurerm_resource_group.security-rg.name
  
  enabled_for_deployment          = var.kv-vm-deployment
  enabled_for_disk_encryption     = var.kv-disk-encryption
  enabled_for_template_deployment = var.kv-template-deployment

  tags = {
    environment = "${var.environment}"
  }

  policies = {
    full = {
      tenant_id               = var.azure-tenant-id
      object_id               = var.kv-full-object-id
      key_permissions         = var.kv-key-permissions-full
      secret_permissions      = var.kv-secret-permissions-full
      certificate_permissions = var.kv-certificate-permissions-full
      storage_permissions     = var.kv-storage-permissions-full
    }
    read = {
      tenant_id               = var.azure-tenant-id
      object_id               = var.kv-read-object-id
      key_permissions         = var.kv-key-permissions-read
      secret_permissions      = var.kv-secret-permissions-read
      certificate_permissions = var.kv-certificate-permissions-read
      storage_permissions     = var.kv-storage-permissions-read
    }
  }

  secrets = var.kv-secrets
}
