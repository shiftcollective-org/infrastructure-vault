# This configuration uses the "environment_default" module
# which is supposed to create default engines for each 
# environment. This module will:
# * Create ssh-signer-ENV engine and a role associated with it
# * Create a KV backend for secret storage at secrets-ENV
# Note that the policies for these engines are created
# explicitly in policies.tf.

# Mgmt Default backends
module "mgmt-default-backends" {
  source           = "./modules/environment_default"
  environment_name = "mgmt"
  depends_on       = [vault_github_auth_backend.github-auth]
}

# Dev Default backends
module "dev-default-backends" {
  source           = "./modules/environment_default"
  environment_name = "dev"
  depends_on       = [vault_github_auth_backend.github-auth]
}

# Prod Default backends
module "prod-default-backends" {
  source           = "./modules/environment_default"
  environment_name = "prod"
  depends_on       = [vault_github_auth_backend.github-auth]
}
