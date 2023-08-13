resource "vault_mount" "secrets_mount" {
  path        = "secrets-${var.environment_name}"
  type        = "kv"
  options     = { version = "2" }
  description = "KV engine for ${var.environment_name}"
}

resource "vault_mount" "ssh_signer_mount" {
  type        = "ssh"
  path        = "ssh-signer-${var.environment_name}"
  description = "SSH signer for ${var.environment_name} environment"
}

