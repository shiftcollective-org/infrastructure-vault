################
#  PKI Config  #
################

# This configuration is currently _unused_ and is only a preparation for potential
# future uses of CAs.
# For each environment an intermediate CA is created.
#
# This code can also be transformed into a module or merged with an existing one.


resource "vault_pki_secret_backend_root_cert" "shiftcollective_root_cert" {
  backend              = vault_mount.root_pki_mount.path
  type                 = "internal"
  common_name          = "ShiftCollective Root CA"
  ttl                  = 86400
  format               = "pem"
  private_key_format   = "der"
  key_type             = "rsa"
  key_bits             = 4096
  exclude_cn_from_sans = true
  ou                   = "Infrastructure"
  organization         = "ShiftCollective-org"
}

# Mgmt Intermediate CA
resource "vault_pki_secret_backend_intermediate_cert_request" "mgmt_intermediate_csr" {
  backend     = vault_mount.intermediate_pki_mgmt_mount.path
  type        = vault_pki_secret_backend_root_cert.shiftcollective_root_cert.type
  common_name = "shiftcollective-mgmt"
}

resource "vault_pki_secret_backend_root_sign_intermediate" "mgmt_intermediate_signed" {
  backend              = vault_mount.root_pki_mount.path
  csr                  = vault_pki_secret_backend_intermediate_cert_request.mgmt_intermediate_csr.csr
  common_name          = "Mgmt Intermediate CA"
  exclude_cn_from_sans = true
  ou                   = "Management"
  organization         = "ShiftCollective-org"
  revoke               = true
}

resource "vault_pki_secret_backend_intermediate_set_signed" "mgmt_intermediate_cert" {
  backend     = vault_mount.intermediate_pki_mgmt_mount.path
  certificate = vault_pki_secret_backend_root_sign_intermediate.mgmt_intermediate_signed.certificate
}

# Dev Intermediate CA
resource "vault_pki_secret_backend_intermediate_cert_request" "dev_intermediate_csr" {
  backend     = vault_mount.intermediate_pki_dev_mount.path
  type        = vault_pki_secret_backend_root_cert.shiftcollective_root_cert.type
  common_name = "shiftcollective-dev"
}

resource "vault_pki_secret_backend_root_sign_intermediate" "dev_intermediate_signed" {
  backend              = vault_mount.root_pki_mount.path
  csr                  = vault_pki_secret_backend_intermediate_cert_request.dev_intermediate_csr.csr
  common_name          = "Dev Intermediate CA"
  exclude_cn_from_sans = true
  ou                   = "Development"
  organization         = "ShiftCollective-org"
  revoke               = true
}

resource "vault_pki_secret_backend_intermediate_set_signed" "dev_intermediate_cert" {
  backend     = vault_mount.intermediate_pki_dev_mount.path
  certificate = vault_pki_secret_backend_root_sign_intermediate.dev_intermediate_signed.certificate
}

# Prod Intermediate CA
resource "vault_pki_secret_backend_intermediate_cert_request" "prod_intermediate_csr" {
  backend     = vault_mount.intermediate_pki_prod_mount.path
  type        = vault_pki_secret_backend_root_cert.shiftcollective_root_cert.type
  common_name = "shiftcollective-prod"
}

resource "vault_pki_secret_backend_root_sign_intermediate" "prod_intermediate_signed" {
  backend              = vault_mount.root_pki_mount.path
  csr                  = vault_pki_secret_backend_intermediate_cert_request.prod_intermediate_csr.csr
  common_name          = "Prod Intermediate CA"
  exclude_cn_from_sans = true
  ou                   = "Production"
  organization         = "ShiftCollective-org"
  revoke               = true
}

resource "vault_pki_secret_backend_intermediate_set_signed" "prod_intermediate_cert" {
  backend     = vault_mount.intermediate_pki_prod_mount.path
  certificate = vault_pki_secret_backend_root_sign_intermediate.prod_intermediate_signed.certificate
}
