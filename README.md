
# Terraform Vault KV Config

This Terraform module creates multiple secrets in any given kv path in a Vault instance from a yaml file.


## Usage/Examples

```hcl
locals {
  vault_config = yamldecode(file("${path.module}/vault_config.yaml"))
  vault_kv_secrets = local.vault_config.kv_secrets
}

module "homelab_kv" {
  source = "github.com/kalenarndt/terraform-vault-kv-config"
  vault_kv_secrets = local.vault_kv_secrets
}
```
The examples folder contains an example with a main.tf,providers.tf, settings.tf and vault_config.yaml file. Use this if you want to get up and running or follow the directions below.


Ensure that you modify the vault_config.yaml file to match the path and secrets you would like to provision as this is what the module uses to deploy and configure the nested hosts.

Place the vault_config.yaml file where your main.tf file is in your deployment or modify the usage example for the path to your yaml. 

# IMPORTANT YOU SHOULD PROTECT YOUR YAML FILE AND THE TFSTATE WHEN DOING THIS. 
```yaml
kv_secrets:
 # Site-A Secrets
  vcenter_sa_root:
    path: "homelab/vmware/sa/vcenter/users/root"
    data_json:
      vcenter_username: "root"
      vcenter_password: "VMware123!"
  vcenter_sa_administrator:
    path: "homelab/vmware/sa/vcenter/users/administrator"
    data_json:
      vcenter_username: "administrator@vsphere.local"
      vcenter_password: "VMware123!"
  vcenter_sa_license:
    path: "homelab/vmware/sa/vcenter/license"
    data_json:
      license_key: "xxxxx-xxxxx-xxxxx-xxxxx-xxxxx"
  esxi_sa_root:
    path: "homelab/vmware/sa/esxi/users/root"
    data_json:
      esxi_username: "root"
      esxi_password: "yourpassword"
  esxi_sa_license:
    path: "homelab/vmware/sa/esxi/license"
    data_json:
      license_key: "xxxxx-xxxxx-xxxxx-xxxxx-xxxxx"
  nsxt_sa_root:
    path: "homelab/vmware/sa/nsxt/users/root"
    data_json:
      nsxt_username: "root"
      nsxt_password: "yourpassword"
  nsxt_sa_admin:
    path: "homelab/vmware/sa/nsxt/users/admin"
    data_json:
      nsxt_username: "admin"
      nsxt_password: "yourpassword"
  nsxt_sa_audit:
    path: "homelab/vmware/sa/nsxt/users/audit"
    data_json:
      nsxt_username: "audit"
      nsxt_password: "yourpassword"
  nsxt_sa_license:
    path: "homelab/vmware/sa/nsxt/license"
    data_json:
      license_key: "xxxxx-xxxxx-xxxxx-xxxxx-xxxxx"
```

  
## License

[MIT](https://choosealicense.com/licenses/mit/)


## TF Docs Output
--- 

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~>2.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | ~>2.20.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_generic_secret.kv_secrets](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vault_kv_secrets"></a> [vault\_kv\_secrets](#input\_vault\_kv\_secrets) | This is a map passed from a yaml file that is looped through to build secrets at a pre-determined path. | `map(any)` | `null` | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->