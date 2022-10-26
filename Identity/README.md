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
| <a name="module_iam-compartments"></a> [iam-compartments](#module\_iam-compartments) | ./modules/identity/iam-compartment | n/a |
| <a name="module_iam-groups"></a> [iam-groups](#module\_iam-groups) | ./modules/identity/iam-group | n/a |
| <a name="module_iam-policies"></a> [iam-policies](#module\_iam-policies) | ./modules/identity/iam-policy | n/a |
| <a name="module_sub-compartments-level1"></a> [sub-compartments-level1](#module\_sub-compartments-level1) | ./modules/identity/iam-compartment | n/a |
| <a name="module_sub-compartments-level2"></a> [sub-compartments-level2](#module\_sub-compartments-level2) | ./modules/identity/iam-compartment | n/a |
| <a name="module_sub-compartments-level3"></a> [sub-compartments-level3](#module\_sub-compartments-level3) | ./modules/identity/iam-compartment | n/a |
| <a name="module_sub-compartments-level4"></a> [sub-compartments-level4](#module\_sub-compartments-level4) | ./modules/identity/iam-compartment | n/a |
| <a name="module_sub-compartments-level5"></a> [sub-compartments-level5](#module\_sub-compartments-level5) | ./modules/identity/iam-compartment | n/a |

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
| <a name="input_compartment_ocids"></a> [compartment\_ocids](#input\_compartment\_ocids) | START\_compartment\_ocids# | `map(any)` | <pre>{<br>  "ManagedCompartmentForPaaS": "ocid1.compartment.oc1..aaaaaaaab5bazhbcu3soo5kaexkvmoywm2fttp7yt46qkaxgtpipjmuxjk4q",<br>  "Network": "ocid1.compartment.oc1..aaaaaaaa4thtq42lwpqo6rcm6undudg3k4h4tgpmlubssgfrya6ysltbdcoq",<br>  "Production": "ocid1.compartment.oc1..aaaaaaaalasgiuui7qauragkwm5er5mkpy6zkwn2oofw7vaqyc4nxnr3shcq",<br>  "Security": "ocid1.compartment.oc1..aaaaaaaahxr4u6vp3kytkld6eg2xbtdo235jcqo7ea737fabaolho2hzvcka",<br>  "Testing": "ocid1.compartment.oc1..aaaaaaaayvpal43jdti3azxvfwtbepg2xjsbbx5tromjyziq3lnui64bkcnq",<br>  "root": "ocid1.tenancy.oc1..aaaaaaaae42wmdy3jjh3edy5ndzvaseabbrxkh25hjrhdwkle5begqqdjbzq"<br>}</pre> | no |
| <a name="input_compartments"></a> [compartments](#input\_compartments) | n/a | `map(any)` | <pre>{<br>  "compartment_level1": {},<br>  "compartment_level2": {},<br>  "compartment_level3": {},<br>  "compartment_level4": {},<br>  "compartment_level5": {},<br>  "root": {}<br>}</pre> | no |
| <a name="input_fingerprint"></a> [fingerprint](#input\_fingerprint) | n/a | `string` | `"88:57:89:8e:a2:67:58:c0:ad:d2:3e:61:31:bd:f9:6c"` | no |
| <a name="input_groups"></a> [groups](#input\_groups) | n/a | `map(any)` | `{}` | no |
| <a name="input_policies"></a> [policies](#input\_policies) | n/a | `map(any)` | `{}` | no |
| <a name="input_private_key_path"></a> [private\_key\_path](#input\_private\_key\_path) | n/a | `string` | `"/cd3user/tenancies/GenXP/oci_api_private.pem"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-ashburn-1"` | no |
| <a name="input_root"></a> [root](#input\_root) | n/a | `string` | `"ocid1.tenancy.oc1..aaaaaaaae42wmdy3jjh3edy5ndzvaseabbrxkh25hjrhdwkle5begqqdjbzq"` | no |
| <a name="input_tag_defaults"></a> [tag\_defaults](#input\_tag\_defaults) | To make the Tag keys as default to compartments | `map(any)` | `{}` | no |
| <a name="input_tag_keys"></a> [tag\_keys](#input\_tag\_keys) | To provision Tag Keys | `map(any)` | `{}` | no |
| <a name="input_tag_namespaces"></a> [tag\_namespaces](#input\_tag\_namespaces) | To provision Namespaces | `map(any)` | `{}` | no |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | n/a | `string` | `"ocid1.tenancy.oc1..aaaaaaaae42wmdy3jjh3edy5ndzvaseabbrxkh25hjrhdwkle5begqqdjbzq"` | no |
| <a name="input_user_ocid"></a> [user\_ocid](#input\_user\_ocid) | n/a | `string` | `"ocid1.user.oc1..aaaaaaaam7eoo4affhz3yootywjdp2ygqcf4cnqk2axde426p2mfneg4743a"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->