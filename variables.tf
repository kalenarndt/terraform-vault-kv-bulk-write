variable "vault_kv_secrets" {
  default     = null
  type        = map(any)
  description = "This is a map passed from a yaml file that is looped through to build secrets at a pre-determined path."
}