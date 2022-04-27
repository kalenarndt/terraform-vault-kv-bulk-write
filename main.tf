locals {
  vault_kv_secrets = var.vault_kv_secrets
}

resource "vault_generic_secret" "kv_secrets" {
  for_each  = nonsensitive(local.vault_kv_secrets)
  path      = each.value.path
  data_json = sensitive(jsonencode(each.value.data_json))
}