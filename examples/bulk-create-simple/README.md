
# Purpose

I blow up my lab ALOT and I use VMware so I needed something that I could recreate all of my static kv credentials once I rebuild vault. This will allow you to spec out all of your static credentials in a yaml file and put them to as many mounts as you would like within the environment. It currently does not support namespaces but this is a planned item when I get around to it.

## Usage/Examples

This example requires that you have a kv mount mounted at `homelab/` if you aren't going to edit the file. What this will do is create the secrets below based on the secret paths and drop in their key:value pairs.

# IMPORTANT: YOU SHOULD PROTECT YOUR YAML FILE AND THE TFSTATE WHEN DOING THIS. 
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
