<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | >= 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | >= 4.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_keys"></a> [keys](#module\_keys) | ./modules/security/key | n/a |
| <a name="module_vaults"></a> [vaults](#module\_vaults) | ./modules/security/vault | n/a |

## Resources

| Name | Type |
|------|------|
| [oci_identity_availability_domains.availability_domains](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_availability_domains) | data source |
| [oci_identity_compartments.compartments](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_compartments) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ManagedCompartmentForPaaS"></a> [ManagedCompartmentForPaaS](#input\_ManagedCompartmentForPaaS) | n/a | `string` | `"ocid1.compartment.oc1..aaaaaaaab5bazhbcu3soo5kaexkvmoywm2fttp7yt46qkaxgtpipjmuxjk4q"` | no |
| <a name="input_Network"></a> [Network](#input\_Network) | n/a | `string` | `"ocid1.compartment.oc1..aaaaaaaa4thtq42lwpqo6rcm6undudg3k4h4tgpmlubssgfrya6ysltbdcoq"` | no |
| <a name="input_Production"></a> [Production](#input\_Production) | n/a | `string` | `"ocid1.compartment.oc1..aaaaaaaalasgiuui7qauragkwm5er5mkpy6zkwn2oofw7vaqyc4nxnr3shcq"` | no |
| <a name="input_Security"></a> [Security](#input\_Security) | n/a | `string` | `"ocid1.compartment.oc1..aaaaaaaahxr4u6vp3kytkld6eg2xbtdo235jcqo7ea737fabaolho2hzvcka"` | no |
| <a name="input_Testing"></a> [Testing](#input\_Testing) | n/a | `string` | `"ocid1.compartment.oc1..aaaaaaaayvpal43jdti3azxvfwtbepg2xjsbbx5tromjyziq3lnui64bkcnq"` | no |
| <a name="input_cloud_guard_configs"></a> [cloud\_guard\_configs](#input\_cloud\_guard\_configs) | n/a | `map(any)` | `{}` | no |
| <a name="input_cloud_guard_targets"></a> [cloud\_guard\_targets](#input\_cloud\_guard\_targets) | n/a | `map(any)` | `{}` | no |
| <a name="input_compartment_ocids"></a> [compartment\_ocids](#input\_compartment\_ocids) | START\_compartment\_ocids# | `map(any)` | <pre>{<br>  "ManagedCompartmentForPaaS": "ocid1.compartment.oc1..aaaaaaaab5bazhbcu3soo5kaexkvmoywm2fttp7yt46qkaxgtpipjmuxjk4q",<br>  "Network": "ocid1.compartment.oc1..aaaaaaaa4thtq42lwpqo6rcm6undudg3k4h4tgpmlubssgfrya6ysltbdcoq",<br>  "Production": "ocid1.compartment.oc1..aaaaaaaalasgiuui7qauragkwm5er5mkpy6zkwn2oofw7vaqyc4nxnr3shcq",<br>  "Security": "ocid1.compartment.oc1..aaaaaaaahxr4u6vp3kytkld6eg2xbtdo235jcqo7ea737fabaolho2hzvcka",<br>  "Testing": "ocid1.compartment.oc1..aaaaaaaayvpal43jdti3azxvfwtbepg2xjsbbx5tromjyziq3lnui64bkcnq",<br>  "root": "ocid1.tenancy.oc1..aaaaaaaae42wmdy3jjh3edy5ndzvaseabbrxkh25hjrhdwkle5begqqdjbzq"<br>}</pre> | no |
| <a name="input_keys"></a> [keys](#input\_keys) | n/a | `map(any)` | `{}` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-ashburn-1"` | no |
| <a name="input_root"></a> [root](#input\_root) | n/a | `string` | `"ocid1.tenancy.oc1..aaaaaaaae42wmdy3jjh3edy5ndzvaseabbrxkh25hjrhdwkle5begqqdjbzq"` | no |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | n/a | `string` | `"ocid1.tenancy.oc1..aaaaaaaae42wmdy3jjh3edy5ndzvaseabbrxkh25hjrhdwkle5begqqdjbzq"` | no |
| <a name="input_vaults"></a> [vaults](#input\_vaults) | n/a | `map(any)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->