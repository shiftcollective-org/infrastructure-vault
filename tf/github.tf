###########################
#  Github Authentication  #
###########################

resource "vault_github_auth_backend" "github-auth" {
  organization = "shiftcollective-org"
}

############################
#  Team Policy Assignment  #
############################

resource "vault_github_team" "admin_team_policies" {
  backend  = vault_github_auth_backend.github-auth.id
  team     = "vault-admins"
  policies = [vault_policy.admin_policy.name]
}

# Infra team can:
# * SSH into any box in any environment
# * Read mgmt and dev secrets 
# * Write secrets for all environments
resource "vault_github_team" "infra_team_policies" {
  backend = vault_github_auth_backend.github-auth.id
  team    = "infrastructure"
  policies = [
    vault_policy.ssh_mgmt_policy.name,
    vault_policy.ssh_dev_policy.name,
    vault_policy.ssh_prod_policy.name,
    vault_policy.secret_reader_mgmt.name,
    vault_policy.secret_reader_dev.name,
    vault_policy.secret_writer_mgmt.name,
    vault_policy.secret_writer_dev.name,
    vault_policy.secret_writer_prod.name,
  ]
}

# Infra team can:
# * SSH into any dev box
# * Read dev secrets 
# * Write secrets for all environments
resource "vault_github_team" "hosting_team_policies" {
  backend = vault_github_auth_backend.github-auth.id
  team    = "hosting"
  policies = [
    vault_policy.ssh_dev_policy.name,
    vault_policy.secret_reader_dev.name,
    vault_policy.secret_writer_mgmt.name,
    vault_policy.secret_writer_dev.name,
    vault_policy.secret_writer_prod.name,
  ]
}
