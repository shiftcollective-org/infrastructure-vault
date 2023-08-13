# Mounts for PKI engines

resource "vault_mount" "root_pki_mount" {
  path                      = "pki"
  type                      = "pki"
  description               = "Root PKI"
  default_lease_ttl_seconds = 8640000
  max_lease_ttl_seconds     = 8640000
}

resource "vault_mount" "intermediate_pki_mgmt_mount" {
  path                      = "pki-mgmt"
  type                      = vault_mount.root_pki_mount.type
  description               = "Intermediate PKI - mgmt"
  default_lease_ttl_seconds = 86400
  max_lease_ttl_seconds     = 86400
}
resource "vault_mount" "intermediate_pki_dev_mount" {
  path                      = "pki-dev"
  type                      = vault_mount.root_pki_mount.type
  description               = "Intermediate PKI - dev"
  default_lease_ttl_seconds = 86400
  max_lease_ttl_seconds     = 86400
}
resource "vault_mount" "intermediate_pki_prod_mount" {
  path                      = "pki-prod"
  type                      = vault_mount.root_pki_mount.type
  description               = "Intermediate PKI - prod"
  default_lease_ttl_seconds = 86400
  max_lease_ttl_seconds     = 86400
}
