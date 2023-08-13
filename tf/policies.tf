resource "vault_policy" "admin_policy" {
  name   = "admins"
  policy = file("policies/admin.hcl")
}

resource "vault_policy" "ssh_mgmt_policy" {
  name   = "ssh-mgmt"
  policy = file("policies/ssh-mgmt.hcl")
}

resource "vault_policy" "ssh_dev_policy" {
  name   = "ssh-dev"
  policy = file("policies/ssh-dev.hcl")
}

resource "vault_policy" "ssh_prod_policy" {
  name   = "ssh-prod"
  policy = file("policies/ssh-prod.hcl")
}

resource "vault_policy" "secret_reader_mgmt" {
  name   = "secret-reader-mgmt"
  policy = file("policies/secret-reader-mgmt.hcl")
}

resource "vault_policy" "secret_writer_mgmt" {
  name   = "secret-writer-mgmt"
  policy = file("policies/secret-writer-mgmt.hcl")
}

resource "vault_policy" "secret_reader_dev" {
  name   = "secret-reader-dev"
  policy = file("policies/secret-reader-dev.hcl")
}

resource "vault_policy" "secret_writer_dev" {
  name   = "secret-writer-dev"
  policy = file("policies/secret-writer-dev.hcl")
}

resource "vault_policy" "secret_reader_prod" {
  name   = "secret-reader-prod"
  policy = file("policies/secret-reader-prod.hcl")
}

resource "vault_policy" "secret_writer_prod" {
  name   = "secret-writer-prod"
  policy = file("policies/secret-writer-prod.hcl")
}

