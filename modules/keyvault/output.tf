output "key-vault-id" {
  description = "Key Vault ID"
  value       = azurerm_key_vault.key-vault.id
}

output "key-vault-url" {
  description = "Key Vault URI"
  value       = azurerm_key_vault.key-vault.vault_uri
}

output "key-vault-secrets" {
  value = values(azurerm_key_vault_secret.secret).*.value
}