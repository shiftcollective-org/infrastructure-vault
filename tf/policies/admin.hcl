# Manage auth methods broadly across Vault
path "auth/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Create, update, and delete auth methods
path "sys/auth/*"
{
  capabilities = ["create", "update", "delete", "sudo"]
}

# List auth methods
path "sys/auth"
{
  capabilities = ["read"]
}

# Create and manage ACL policies
path "sys/policies/acl/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List ACL policies
path "sys/policies/acl"
{
  capabilities = ["list"]
}

# Create and manage secrets engines broadly across Vault.
path "sys/mounts/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List enabled secrets engines
path "sys/mounts"
{
  capabilities = ["read", "list"]
}

# List, create, update, and delete key/value secrets at secrets-mgmt/
path "secrets-mgmt/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List, create, update, and delete key/value secrets at secrets-dev/
path "secrets-dev/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List, create, update, and delete key/value secrets at secrets-prod/
path "secrets-prod/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage SSH signer engines
path "ssh-signer-mgmt/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "ssh-signer-dev/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "ssh-signer-prod/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage PKI engine
path "pki/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
# Read health checks
path "sys/health"
{
  capabilities = ["read", "sudo"]
}
