# Secret engine (KV2)

resource "vault_kv_secret_backend_v2" "secret_backend" {
  mount                = vault_mount.secrets_mount.path
  max_versions         = 5
  delete_version_after = 12600
  cas_required         = true
}

# SSH signer

resource "vault_ssh_secret_backend_ca" "ssh_signer_ca" {
  backend              = vault_mount.ssh_signer_mount.path
  generate_signing_key = true
}

data "vault_auth_backend" "github" {
  path = "github"
}

resource "vault_ssh_secret_backend_role" "ssh-user-role" {
  name                    = "ssh-user"
  backend                 = vault_mount.ssh_signer_mount.path
  key_type                = "ca"
  allow_user_certificates = true
  default_extensions = {
    "permit-pty" : ""
  }
  allowed_users_template = true
  allowed_users          = "{{ identity.entity.aliases.${data.vault_auth_backend.github.accessor}.name}}"
}
