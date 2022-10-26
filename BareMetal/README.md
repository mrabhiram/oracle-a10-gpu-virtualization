<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | >= 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | 4.90.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_instances"></a> [instances](#module\_instances) | ./modules/compute/instance | n/a |
| <a name="module_vlans"></a> [vlans](#module\_vlans) | ./modules/vlan | n/a |

## Resources

| Name | Type |
|------|------|
| [oci_core_route_tables.route_tables](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_route_tables) | data source |
| [oci_core_subnets.oci_subnets](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_subnets) | data source |
| [oci_core_vcns.oci_vcns](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_vcns) | data source |
| [oci_core_vcns.oci_vcns_vlan](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_vcns) | data source |
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
| <a name="input_block_backup_policies"></a> [block\_backup\_policies](#input\_block\_backup\_policies) | To create block volume back policy | `map(any)` | `{}` | no |
| <a name="input_blockvolumes"></a> [blockvolumes](#input\_blockvolumes) | To provision block volumes | `map(any)` | `{}` | no |
| <a name="input_bm_prefix"></a> [bm\_prefix](#input\_bm\_prefix) | n/a | `any` | n/a | yes |
| <a name="input_boot_backup_policies"></a> [boot\_backup\_policies](#input\_boot\_backup\_policies) | Map of boot volume backup policies to be provisioned | `map(any)` | `{}` | no |
| <a name="input_capacity_reservation_ocids"></a> [capacity\_reservation\_ocids](#input\_capacity\_reservation\_ocids) | n/a | `map(any)` | <pre>{<br>  "AD1": "<AD1 Capacity Reservation OCID>",<br>  "AD2": "<AD2 Capacity Reservation OCID>",<br>  "AD3": "<AD3 Capacity Reservation OCID>"<br>}</pre> | no |
| <a name="input_compartment_ocids"></a> [compartment\_ocids](#input\_compartment\_ocids) | START\_compartment\_ocids# | `map(any)` | <pre>{<br>  "ManagedCompartmentForPaaS": "ocid1.compartment.oc1..aaaaaaaab5bazhbcu3soo5kaexkvmoywm2fttp7yt46qkaxgtpipjmuxjk4q",<br>  "Network": "ocid1.compartment.oc1..aaaaaaaa4thtq42lwpqo6rcm6undudg3k4h4tgpmlubssgfrya6ysltbdcoq",<br>  "Production": "ocid1.compartment.oc1..aaaaaaaalasgiuui7qauragkwm5er5mkpy6zkwn2oofw7vaqyc4nxnr3shcq",<br>  "Security": "ocid1.compartment.oc1..aaaaaaaahxr4u6vp3kytkld6eg2xbtdo235jcqo7ea737fabaolho2hzvcka",<br>  "Testing": "ocid1.compartment.oc1..aaaaaaaayvpal43jdti3azxvfwtbepg2xjsbbx5tromjyziq3lnui64bkcnq",<br>  "root": "ocid1.tenancy.oc1..aaaaaaaae42wmdy3jjh3edy5ndzvaseabbrxkh25hjrhdwkle5begqqdjbzq"<br>}</pre> | no |
| <a name="input_experience_id"></a> [experience\_id](#input\_experience\_id) | n/a | `any` | n/a | yes |
| <a name="input_fingerprint"></a> [fingerprint](#input\_fingerprint) | n/a | `string` | `"88:57:89:8e:a2:67:58:c0:ad:d2:3e:61:31:bd:f9:6c"` | no |
| <a name="input_gbs_for_vm"></a> [gbs\_for\_vm](#input\_gbs\_for\_vm) | n/a | `any` | n/a | yes |
| <a name="input_instance_source_ocids"></a> [instance\_source\_ocids](#input\_instance\_source\_ocids) | n/a | `map(any)` | <pre>{<br>  "Linux": "ocid1.image.oc1.iad.aaaaaaaa636rylf7lyhvlmj5iimahyeohqcdqdlroks3we2g5i4bsp4lohda",<br>  "Linux8": "ocid1.image.oc1.iad.aaaaaaaapcf3o54qeigj22nowwdtceyepisigpz3fho67l3xm7lmqkrgb62q",<br>  "PaloAlto": "Palo Alto Networks VM-Series Next Generation Firewall",<br>  "Windows": "ocid1.image.oc1.iad.aaaaaaaa3kazyezsjl3k3bep73bpcyi33g7fpo6xmzz6gomzoub5mid7bi6a"<br>}</pre> | no |
| <a name="input_instance_ssh_keys"></a> [instance\_ssh\_keys](#input\_instance\_ssh\_keys) | n/a | `map(any)` | <pre>{<br>  "ssh_public_key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDPGrEzFuI+bTmH1iasrEFzX1WLrFdsh1ePk69/YsrA+QNRE6t8rXnY2JbwYHStIms3i+Xs+4Njy3I7iznFTye+gyCsuNoZNDtuBRdeHhI5pLsg05BhTPbfLaF63PxDJJ/iVa8idGfI9wdtxlK2chcQpu4Efkt3dQMegYYsL+PU/diVSPX+Kn97ltc8iJbFcBXbkfgzRX3UN2S5bn6v6DvDgvLTfTxPXxP1q5mEoaPNtNBKe86opzxPspSH8uIr5z00Btiv1o+wLnduC33nxQLzQ4CEzstjyg1NRd5z3qh+yuE8FSUxq9slbdo1u21ZTZTBLIoH9Q4JxKwZeSUuRuuH GenXP-BM-SSH-Key\nssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDVdnle0MSkopaLO4OrkUE1S9I8Wg6E6bedI/iYqnoWKHGV/HNbWv4oof/YdAYbjEh7By7y24Mbp/oDb63Y0FHdqUEpYWY6laVDoDVE683oewCCj/wqxRVjg4UtK9TlgPuYpuk6Or3ZZXSB1oV2IpumuuC7/TWDuZ354ivFR0AoVjRaZRYUCJRdgWoPCX0Rojn5SMkPGWOCwi0XL5q/OrLseoShghUKfMR0t2xSb1hMXMapvCjFjJQsjPc9qKsw+bNz+snjI2R4nYNOoJWJEpKWbxG6tvjFOGeLB6laKQsI8DSBxIFZYI9eEK6fodeInVZbuFd/0Eosp0p/OAUjz4yV tingh@calisto\nssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDG3L+PiWoM//3PBIi7cZhjYFwKjCEYyo2dgDGVJ+Q3apg/h9nUe2pncgapsDRdz183de1Dn/OyJGg839uaeJfOUZzin6munN9MH7pOh7+R7F1BU1eAoPIUG2BDYGajETRwuz09Y7fxPsV10OcYwVLeuTSfB7vACAl8bgmwWWROviJRN22Ci/4MuFKyU4gB8E7GyKQMR0FL/Wp4v3OKpxsAkHM+tyauvifsQ1BAF5urrHZjxWxoSm5FqkrCn60kRf4QUfqrAkjQOf/loSrRj349l9uHyqc0n8z25Yw8OIohr39MjsLe0z2mJH85oQLSKTVQTLa3o95Cuq/FK2c7DTFlN++CquVSgNFrUEQ3lrgw6Xek1VeKFyoP/yYVvjSy6FGzAbJ4TeiuOMOlVIb+WaTBrssW8034p/mquRRnxDSAhydTUSo51ETS6qEHiMtH4+RwElaplUcdxJOqMKgDYAw2MTwbNKMEqHLtMBDYeurCmlbu0YcNnHT8hXhZwxmJtk0= vince@DEVCOOL"<br>}</pre> | no |
| <a name="input_instances"></a> [instances](#input\_instances) | Map of instances to be provisioned | `map(any)` | `{}` | no |
| <a name="input_private_key_path"></a> [private\_key\_path](#input\_private\_key\_path) | n/a | `string` | `"/cd3user/tenancies/GenXP/oci_api_private.pem"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-ashburn-1"` | no |
| <a name="input_root"></a> [root](#input\_root) | n/a | `string` | `"ocid1.tenancy.oc1..aaaaaaaae42wmdy3jjh3edy5ndzvaseabbrxkh25hjrhdwkle5begqqdjbzq"` | no |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | ###########################  Variables Block OCI  ########################### | `string` | `"ocid1.tenancy.oc1..aaaaaaaae42wmdy3jjh3edy5ndzvaseabbrxkh25hjrhdwkle5begqqdjbzq"` | no |
| <a name="input_user_ocid"></a> [user\_ocid](#input\_user\_ocid) | n/a | `string` | `"ocid1.user.oc1..aaaaaaaam7eoo4affhz3yootywjdp2ygqcf4cnqk2axde426p2mfneg4743a"` | no |
| <a name="input_vlan_cidr_block"></a> [vlan\_cidr\_block](#input\_vlan\_cidr\_block) | n/a | `any` | n/a | yes |
| <a name="input_vlans"></a> [vlans](#input\_vlans) | n/a | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_details"></a> [instance\_details](#output\_instance\_details) | n/a |
| <a name="output_vlan_tag"></a> [vlan\_tag](#output\_vlan\_tag) | n/a |
<!-- END_TF_DOCS -->