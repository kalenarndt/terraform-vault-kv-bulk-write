locals {
  vault_config = yamldecode(file("${path.module}/vault_config.yaml"))
  vault_kv_secrets = local.vault_config.kv_secrets
}

module "homelab_kv" {
  source = "github.com/kalenarndt/terraform-vault-kv-config"
  vault_kv_secrets = local.vault_kv_secrets
}
