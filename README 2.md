<!-- BEGIN_TF_DOCS -->
Pre-requisites: 
1. Object Storage Bucket is created in OCI and the Custom Image export of the VMs, Drivers and other scripts are uploaded to the bucket.
2. All the terraform templates (Identity, Network, Security, Compute, BareMetal) are uploaded as private templates in the "genxp (root)" compartment.
3. Resource Manager Stacks for each of the private templates are created in the "genxp (root)" compartment.

Execution Steps (when run on a server):
1. Create the Identity Components (Compartments, Groups, Dynamic Groups, Policies)
   - Compartment: genxp (root)
   - Stack: Identity-Stack
   - Private Template: Identity
   - Inputs: Values are provided in *.auto.tfvars, modify only if needed else execute terraform directly.
   - Commands to execute via terminal (local/remote machine): 
     - terraform init
     - terraform plan
     - terraform apply (type yes when prompted) (or) terraform apply --auto-approve
   - Commands to execute via Resource Manager: 
     - Open the navigation menu, click Developer Services, and then under Resource Manager, click Stacks.
     - Choose the "genxp (root)" Compartment from the compartment picker. To do this, under List Scope in the Compartment list, click "genxp (root)" compartment.
     - From the list of stacks in the compartment, Click 'Identity-Stack'.
     - Click on Plan -> Provide a user friendly name for the Job -> Click on Plan -> Wait for the job to complete -> Review the logs displayed on the screen.
     - Click on Apply -> Provide a user friendly name for the Job -> Select "Automatically Approve" or the name of previously saved plan -> Click on Apply -> Wait for the job to complete.
     
2. Create the Security Components (Vault, Master Encryption Key, Secrets)
   - Compartment: genxp (root)
   - Stack: Security-Stack
   - Private Template: Security
   - Inputs: Values are provided in *.auto.tfvars, modify only if needed else execute terraform directly.
   - Commands to execute via terminal (local/remote machine): 
     - terraform init
     - terraform plan
     - terraform apply (type yes when prompted) (or) terraform apply --auto-approve
   - Commands to execute via Resource Manager: 
     - Open the navigation menu, click Developer Services, and then under Resource Manager, click Stacks.
     - Choose the "genxp (root)" Compartment from the compartment picker. To do this, under List Scope in the Compartment list, click "genxp (root)" compartment.
     - From the list of stacks in the compartment, Click 'Security-Stack'.
     - Click on Plan -> Provide a user friendly name for the Job -> Click on Plan -> Wait for the job to complete -> Review the logs displayed on the screen.
     - Click on Apply -> Provide a user friendly name for the Job -> Select "Automatically Approve" or the name of previously saved plan -> Click on Apply -> Wait for the job to complete.
   - Store your private key (of SSH Key pair in PEM/OpenSSH format) in the vault - This key will be used to login to the Bare Metal server as well as the VMs.
     - Open the navigation menu, click Identity & Security, and then click Vault.
     - Choose the "Security" Compartment from the compartment picker. To do this, under List Scope in the Compartment list, click "Security" compartment.
     - From the list of vaults in the compartment, Click "GenXP-Vault" to use the existing vault.
     - Click Secrets, and then click Create Secret.
     - In the Create Secret dialog box, choose a compartment from the Create in Compartment list. (Secrets can exist outside the compartment the vault is in.)
     - Click Name, and then enter a name to identify the secret. Avoid entering confidential information.
     - Click Description, and then enter a brief description of the secret to help identify it. Avoid entering any confidential information in this field.
     - Choose the master encryption key - "GenXP-MasterEncryptionKey".
     - Click Secret Contents, and then enter the secret contents. (The maximum allowable size for a secret bundle is 25 KB.)
     - When you are finished, click Create Secret.

3. Create the Networking Components (VCN, Subnets, Route Tables, Security List, NAT Gateway, Internet Gateway, Service Gateway, NSGs)
   - Compartment: genxp (root)
   - Stack: Network-Stack
   - Private Template: Network
   - Inputs: Values are provided in *.auto.tfvars, modify only if needed else execute terraform directly.
   - Commands to execute via terminal (local/remote machine): 
     - terraform init
     - terraform plan
     - terraform apply (type yes when prompted) (or) terraform apply --auto-approve
   - Commands to execute via Resource Manager: 
     - Open the navigation menu, click Developer Services, and then under Resource Manager, click Stacks.
     - Choose the "genxp (root)" Compartment from the compartment picker. To do this, under List Scope in the Compartment list, click "genxp (root)" compartment.
     - From the list of stacks in the compartment, Click 'Network-Stack'.
     - Click on Plan -> Provide a user friendly name for the Job -> Click on Plan -> Wait for the job to complete -> Review the logs displayed on the screen.
     - Click on Apply -> Provide a user friendly name for the Job -> Select "Automatically Approve" or the name of previously saved plan -> Click on Apply -> Wait for the job to complete.

4. Create the Compute Instance along with its Boot Volumes and the backup policy
   - Compartment: genxp (root)
   - Stack: Compute-Stack
   - Private Template: Compute
   - Inputs: Values are provided in *.auto.tfvars, modify only if needed else execute terraform directly.
   - Commands to execute via terminal (local/remote machine): 
     - terraform init
     - terraform plan
     - terraform apply (type yes when prompted) (or) terraform apply --auto-approve
   - Commands to execute via Resource Manager: 
     - Open the navigation menu, click Developer Services, and then under Resource Manager click Stacks.
     - Choose the "genxp (root)" Compartment from the compartment picker. To do this, under List Scope in the Compartment list, click "genxp (root)" compartment.
     - From the list of stacks in the compartment, Click 'Compute-Stack'.
     - Click on Plan -> Provide a user friendly name for the Job -> Click on Plan -> Wait for the job to complete -> Review the logs displayed on the screen.
     - Click on Apply -> Provide a user friendly name for the Job -> Select "Automatically Approve" or the name of previously saved plan -> Click on Apply -> Wait for the job to complete.

5. Create the Bare Metal Server along with the desired number of GPU slices/VMs, VLAN, Public IPs and Private IPs.
   - Compartment: genxp (root)
   - Stack: BareMetal-Stack
   - Private Template: BareMetal
   - This stack handles the following tasks:
      NOTE: Use a separate stack (with a meaningful name) for each Baremetal instance.
      a. Creates a Bare Metal Instance
      b. Creates a VLAN of the CIDR as specified in the input
      c. Calculates and creates the Private and Public IPs as per user input for gbs_for_vm.
      d. Configures the BM - Installs the Nvidia driver, slices the GPUs, creates a bridge network for the VMs, creates the VMs, and configures the VMs
   - Steps to provision a Stack from Private Template:
      a. Open the navigation menu, click Developer Services, and then under Resource Manager, click Private Templates.
      b. Choose the "genxp (root)" Compartment from the compartment picker. Select "BareMetal" from the list of templates.
      c. Click on Create Stack, Provide a user friendly name for the Stack, provide a description, and then click on next.
      d. Configure the variables as per inputs in the following section. Click on Next. Review the details and click Create.
   - Inputs: (To be given when prompted during terraform plan/apply via terminal or while editing the Resource Manager Stack)
     - bm_prefix: A prefix to uniquely identify the bare metal instance in the tenancy.
     - vlan_cidr_block: VLAN CIDR block to be used for assigning IPs to the VMs ( This VLAN CIDR should be a part of the VCN CIDR and it should be free/unallocated)
     - gbs_for_vm: GBs for the VM, to calculate the number of slices of GPUs and VMs.
     - experience_id: Customer Experience ID
     - Change the name of the secret (secrets_name = "bm-ssh-key"), if you are using a new one in genxp_bare_metal_instances.auto.tfvars. Defaults to "bm-ssh-key".
     - Other values are provided in *.auto.tfvars, modify only if needed else execute terraform directly.
   - Commands to execute via terminal (local/remote machine): 
     - terraform init
     - terraform plan
     - terraform apply (type yes when prompted) (or) terraform apply --auto-approve
   - Commands to execute via Resource Manager: 
     - Open the navigation menu, click Developer Services, and then under Resource Manager, click Stacks.
     - Choose the "genxp (root)" Compartment from the compartment picker. To do this, under List Scope in the Compartment list, click "genxp (root)" compartment.
     - From the list of stacks in the compartment, Click 'BareMetal-Stack'.
     - Click on Plan -> Provide a user friendly name for the Job -> Click on Plan -> Wait for the job to complete -> Review the logs displayed on the screen.
     - Click on Apply -> Provide a user friendly name for the Job -> Select "Automatically Approve" or the name of previously saved plan -> Click on Apply -> Wait for the job to complete.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | >= 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | 4.87.0 |


## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_custom-dhcps"></a> [custom-dhcps](#module\_custom-dhcps) | ./modules/network/custom-dhcp | n/a |
| <a name="module_default-dhcps"></a> [default-dhcps](#module\_default-dhcps) | ./modules/network/default-dhcp | n/a |
| <a name="module_default-route-tables"></a> [default-route-tables](#module\_default-route-tables) | ./modules/network/default-route-table | n/a |
| <a name="module_default-security-lists"></a> [default-security-lists](#module\_default-security-lists) | ./modules/network/default-sec-list | n/a |
| <a name="module_drg-attachments"></a> [drg-attachments](#module\_drg-attachments) | ./modules/network/drg-attachment | n/a |
| <a name="module_drg-route-distribution-statements"></a> [drg-route-distribution-statements](#module\_drg-route-distribution-statements) | ./modules/network/drg-route-distribution-statement | n/a |
| <a name="module_drg-route-distributions"></a> [drg-route-distributions](#module\_drg-route-distributions) | ./modules/network/drg-route-distribution | n/a |
| <a name="module_drg-route-rules"></a> [drg-route-rules](#module\_drg-route-rules) | ./modules/network/drg-route-rule | n/a |
| <a name="module_drg-route-tables"></a> [drg-route-tables](#module\_drg-route-tables) | ./modules/network/drg-route-table | n/a |
| <a name="module_drgs"></a> [drgs](#module\_drgs) | ./modules/network/drg | n/a |
| <a name="module_exported-lpgs"></a> [exported-lpgs](#module\_exported-lpgs) | ./modules/network/lpg | n/a |
| <a name="module_hub-lpgs"></a> [hub-lpgs](#module\_hub-lpgs) | ./modules/network/lpg | n/a |
| <a name="module_igws"></a> [igws](#module\_igws) | ./modules/network/igw | n/a |
| <a name="module_ngws"></a> [ngws](#module\_ngws) | ./modules/network/ngw | n/a |
| <a name="module_none-lpgs"></a> [none-lpgs](#module\_none-lpgs) | ./modules/network/lpg | n/a |
| <a name="module_nsg-rules"></a> [nsg-rules](#module\_nsg-rules) | ./modules/network/nsg-rules | n/a |
| <a name="module_nsgs"></a> [nsgs](#module\_nsgs) | ./modules/network/nsg | n/a |
| <a name="module_peer-lpgs"></a> [peer-lpgs](#module\_peer-lpgs) | ./modules/network/lpg | n/a |
| <a name="module_route-tables"></a> [route-tables](#module\_route-tables) | ./modules/network/route-table | n/a |
| <a name="module_security-lists"></a> [security-lists](#module\_security-lists) | ./modules/network/sec-list | n/a |
| <a name="module_sgws"></a> [sgws](#module\_sgws) | ./modules/network/sgw | n/a |
| <a name="module_spoke-lpgs"></a> [spoke-lpgs](#module\_spoke-lpgs) | ./modules/network/lpg | n/a |
| <a name="module_subnets"></a> [subnets](#module\_subnets) | ./modules/network/subnet | n/a |
| <a name="module_vcn-log-groups"></a> [vcn-log-groups](#module\_vcn-log-groups) | ./modules/managementservices/log-group | n/a |
| <a name="module_vcn-logs"></a> [vcn-logs](#module\_vcn-logs) | ./modules/managementservices/log | n/a |
| <a name="module_vcns"></a> [vcns](#module\_vcns) | ./modules/network/vcn | n/a |
| <a name="module_keys"></a> [keys](#module\_keys) | ./modules/security/key | n/a |
| <a name="module_vaults"></a> [vaults](#module\_vaults) | ./modules/security/vault | n/a |
| <a name="module_instances"></a> [instances](#module\_instances) | ./modules/compute/instance | n/a |
| <a name="module_vlans"></a> [vlans](#module\_vlans) | ./modules/vlan | n/a |


## Resources

| Name | Type |
|------|------|
| [oci_core_drg_route_distributions.drg_route_distributions](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_drg_route_distributions) | data source |
| [oci_core_drg_route_tables.drg_route_tables](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_drg_route_tables) | data source |
| [oci_identity_availability_domains.availability_domains](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_availability_domains) | data source |
| [oci_identity_compartments.compartments](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_compartments) | data source |
| [oci_identity_availability_domains.availability_domains](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_availability_domains) | data source |
| [oci_identity_compartments.compartments](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_compartments) | data source |
| [oci_core_route_tables.route_tables](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_route_tables) | data source |
| [oci_core_subnets.oci_subnets](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_subnets) | data source |
| [oci_core_vcns.oci_vcns](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_vcns) | data source |
| [oci_core_vcns.oci_vcns_vlan](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_vcns) | data source |
| [oci_identity_availability_domains.availability_domains](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_availability_domains) | data source |
| [oci_identity_compartments.compartments](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_compartments) | data source |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity_reservation_ocids"></a> [capacity\_reservation\_ocids](#input\_capacity\_reservation\_ocids) | n/a | `map(any)` | <pre>{<br>  "AD1": "<AD1 Capacity Reservation OCID>",<br>  "AD2": "<AD2 Capacity Reservation OCID>",<br>  "AD3": "<AD3 Capacity Reservation OCID>"<br>}</pre> | no |
| <a name="input_compartment_ocids"></a> [compartment\_ocids](#input\_compartment\_ocids) | START\_compartment\_ocids# | `map(any)` | <pre>{<br>  "ShrutiSubramanian": "ocid1.compartment.oc1..aaaaaaaa2dgo2sqz42anxmsznz7sxfgch5jzhiq4ttow5d6sbevidnirevva"<br>}</pre> | no |
| <a name="input_custom_dhcps"></a> [custom\_dhcps](#input\_custom\_dhcps) | n/a | `map(any)` | `{}` | no |
| <a name="input_data_drg_route_table_distributions"></a> [data\_drg\_route\_table\_distributions](#input\_data\_drg\_route\_table\_distributions) | n/a | `map(any)` | `{}` | no |
| <a name="input_data_drg_route_tables"></a> [data\_drg\_route\_tables](#input\_data\_drg\_route\_tables) | n/a | `map(any)` | `{}` | no |
| <a name="input_default_dhcps"></a> [default\_dhcps](#input\_default\_dhcps) | n/a | `map(any)` | `{}` | no |
| <a name="input_default_route_tables"></a> [default\_route\_tables](#input\_default\_route\_tables) | n/a | `map(any)` | `{}` | no |
| <a name="input_default_seclists"></a> [default\_seclists](#input\_default\_seclists) | n/a | `map(any)` | `{}` | no |
| <a name="input_drg_attachments"></a> [drg\_attachments](#input\_drg\_attachments) | n/a | `map(any)` | `{}` | no |
| <a name="input_drg_route_distribution_statements"></a> [drg\_route\_distribution\_statements](#input\_drg\_route\_distribution\_statements) | n/a | `map(any)` | `{}` | no |
| <a name="input_drg_route_distributions"></a> [drg\_route\_distributions](#input\_drg\_route\_distributions) | n/a | `map(any)` | `{}` | no |
| <a name="input_drg_route_rules"></a> [drg\_route\_rules](#input\_drg\_route\_rules) | n/a | `map(any)` | `{}` | no |
| <a name="input_drg_route_tables"></a> [drg\_route\_tables](#input\_drg\_route\_tables) | n/a | `map(any)` | `{}` | no |
| <a name="input_drgs"></a> [drgs](#input\_drgs) | n/a | `map(any)` | `{}` | no |
| <a name="input_fingerprint"></a> [fingerprint](#input\_fingerprint) | n/a | `string` | `"02:51:ce:5d:2b:ee:86:a4:1c:83:92:a7:96:22:e0:5a"` | no |
| <a name="input_igws"></a> [igws](#input\_igws) | n/a | `map(any)` | `{}` | no |
| <a name="input_lpgs"></a> [lpgs](#input\_lpgs) | n/a | `map(any)` | <pre>{<br>  "exported-lpgs": {},<br>  "hub-lpgs": {},<br>  "none-lpgs": {},<br>  "peer-lpgs": {},<br>  "spoke-lpgs": {}<br>}</pre> | no |
| <a name="input_ngws"></a> [ngws](#input\_ngws) | n/a | `map(any)` | `{}` | no |
| <a name="input_nsg_rules"></a> [nsg\_rules](#input\_nsg\_rules) | n/a | `map(any)` | `{}` | no |
| <a name="input_nsgs"></a> [nsgs](#input\_nsgs) | n/a | `map(any)` | `{}` | no |
| <a name="input_private_key_path"></a> [private\_key\_path](#input\_private\_key\_path) | n/a | `string` | `"oci_private.pem"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-ashburn-1"` | no |
| <a name="input_route_tables"></a> [route\_tables](#input\_route\_tables) | n/a | `map(any)` | `{}` | no |
| <a name="input_seclists"></a> [seclists](#input\_seclists) | n/a | `map(any)` | `{}` | no |
| <a name="input_sgws"></a> [sgws](#input\_sgws) | n/a | `map(any)` | `{}` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | n/a | `map(any)` | `{}` | no |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | n/a | `string` | `"ocid1.tenancy.oc1..aaaaaaaaplkmid2untpzjcxrmbv4nowe74yb4lr6idtckwo4wyf7jh23be4q"` | no |
| <a name="input_user_ocid"></a> [user\_ocid](#input\_user\_ocid) | n/a | `string` | `"ocid1.user.oc1..aaaaaaaacukozvprgq2ruhf255z3qhuwywh6kyb27dffa6zetesiv3jsleja"` | no |
| <a name="input_vcn_log_groups"></a> [vcn\_log\_groups](#input\_vcn\_log\_groups) | n/a | `map(any)` | `{}` | no |
| <a name="input_vcn_logs"></a> [vcn\_logs](#input\_vcn\_logs) | n/a | `map(any)` | `{}` | no |
| <a name="input_vcns"></a> [vcns](#input\_vcns) | n/a | `map(any)` | `{}` | no |
| <a name="input_cloud_guard_configs"></a> [cloud\_guard\_configs](#input\_cloud\_guard\_configs) | n/a | `map(any)` | `{}` | no |
| <a name="input_cloud_guard_targets"></a> [cloud\_guard\_targets](#input\_cloud\_guard\_targets) | n/a | `map(any)` | `{}` | no |
| <a name="input_compartment_ocids"></a> [compartment\_ocids](#input\_compartment\_ocids) | START\_compartment\_ocids# | `map(any)` | <pre>{<br>  "ShrutiSubramanian": "ocid1.compartment.oc1..aaaaaaaa2dgo2sqz42anxmsznz7sxfgch5jzhiq4ttow5d6sbevidnirevva"<br>}</pre> | no |
| <a name="input_fingerprint"></a> [fingerprint](#input\_fingerprint) | n/a | `string` | `"02:51:ce:5d:2b:ee:86:a4:1c:83:92:a7:96:22:e0:5a"` | no |
| <a name="input_keys"></a> [keys](#input\_keys) | n/a | `map(any)` | `{}` | no |
| <a name="input_private_key_path"></a> [private\_key\_path](#input\_private\_key\_path) | n/a | `string` | `"oci_private.pem"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-ashburn-1"` | no |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | n/a | `string` | `"ocid1.tenancy.oc1..aaaaaaaaplkmid2untpzjcxrmbv4nowe74yb4lr6idtckwo4wyf7jh23be4q"` | no |
| <a name="input_user_ocid"></a> [user\_ocid](#input\_user\_ocid) | n/a | `string` | `"ocid1.user.oc1..aaaaaaaacukozvprgq2ruhf255z3qhuwywh6kyb27dffa6zetesiv3jsleja"` | no |
| <a name="input_vaults"></a> [vaults](#input\_vaults) | n/a | `map(any)` | `{}` | no |
| <a name="input_block_backup_policies"></a> [block\_backup\_policies](#input\_block\_backup\_policies) | To create block volume back policy | `map(any)` | `{}` | no |
| <a name="input_blockvolumes"></a> [blockvolumes](#input\_blockvolumes) | To provision block volumes | `map(any)` | `{}` | no |
| <a name="input_bm_prefix"></a> [bm\_prefix](#input\_bm\_prefix) | n/a | `any` | n/a | yes |
| <a name="input_boot_backup_policies"></a> [boot\_backup\_policies](#input\_boot\_backup\_policies) | Map of boot volume backup policies to be provisioned | `map(any)` | `{}` | no |
| <a name="input_capacity_reservation_ocids"></a> [capacity\_reservation\_ocids](#input\_capacity\_reservation\_ocids) | n/a | `map(any)` | <pre>{<br>  "AD1": "<AD1 Capacity Reservation OCID>",<br>  "AD2": "<AD2 Capacity Reservation OCID>",<br>  "AD3": "<AD3 Capacity Reservation OCID>"<br>}</pre> | no |
| <a name="input_compartment_ocids"></a> [compartment\_ocids](#input\_compartment\_ocids) | START\_compartment\_ocids# | `map(any)` | <pre>{<br>  "ShrutiSubramanian": "ocid1.compartment.oc1..aaaaaaaa2dgo2sqz42anxmsznz7sxfgch5jzhiq4ttow5d6sbevidnirevva"<br>}</pre> | no |
| <a name="input_fingerprint"></a> [fingerprint](#input\_fingerprint) | n/a | `string` | `"02:51:ce:5d:2b:ee:86:a4:1c:83:92:a7:96:22:e0:5a"` | no |
| <a name="input_gbs_for_vm"></a> [gbs\_for\_vm](#input\_gbs\_for\_vm) | n/a | `any` | n/a | yes |
| <a name="input_instance_source_ocids"></a> [instance\_source\_ocids](#input\_instance\_source\_ocids) | n/a | `map(any)` | <pre>{<br>  "BMA10": "ocid1.image.oc1.iad.aaaaaaaapcf3o54qeigj22nowwdtceyepisigpz3fho67l3xm7lmqkrgb62q",<br>  "Linux": "<LATEST LINUX OCID HERE>",<br>  "Windows": "<LATEST WINDOWS OCID HERE>"<br>}</pre> | no |
| <a name="input_instance_ssh_keys"></a> [instance\_ssh\_keys](#input\_instance\_ssh\_keys) | n/a | `map(any)` | <pre>{<br>  "ssh_public_key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCfi+6/UPxBAH5S3Nq23Uhu49BYKEcgccBQrvgwsdNO7PkRnzn9v9BkNh0WZkGR7FmzMhCOxDuDHSxHz20b0WJcR+pPavRVYapk3m49iUtDlLyK0SWw78OZHj/MKutE/cR4W7z4fngYhWM/Vs1DiDwHZje1SsrGS2Rn7iQOZwhvI0Ssovo5CujYGOonAcLB31CpXWNJg80EQt+ba6jfjepUOlR55ZPfwMjiLTFsWKeqc1gWqlcVrGbF1wbnM/PXpmvHAGSLGN0Seldy6yahHssw0dKNYjiF9tBte4XRtZ53UbV6OdKNWG57C5xsMA6AwV1UnMrmKRlN0HtgrmCBC/kL ssh-key-2022-02-18\nssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1dJELPhnPuaI2ESc25Q1sy2XCW3yvRdFmoTI1vZx8VNve+WYNAKbmCXd//z75yexaXpFzc+HVtNecJBlalqynAVfwcOCFLcR9th1aHsh5Dqnoy0hHMGnZVfPIHztKAOwIaEej3yltX5K6/MW2Y8z016Pz+pLmQHxixd8XdZFTBTB0CQo2iSFFfvk6gRfWQfrDHrAmJdBUIeTzs7Hfqu7ps5D3h1FcrPBM8nIdAs1/xuZRrDwR+rOYiaTaxLXF2xS9U1Mvk0lEwlLcEAQDeBq44gLB4QamFoBhkaO2PgMIT/9mwVGC6NjNJQ0KNaMb3WDi2pLeSPnx0C4Q683qKcu3 genxp\nssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAvmzo1j2+snzZkHVLjBC9cdHopnsutsT813uGC8xT3wQuCVlWldv8qn8Gt2UapHwXCnYS2fkwtUq0TWP5kyIYh7SWDNaKJzroKRi7dvHEp+dO2eROeNYHn10gxxdjWj4w8bFdBs6+0rE6Nch2uP4mcU8xFdUbDXPSC9/f1/T38WLbP6arRHEIxpzsqIAE7tzzmFlVTRDrLXg81eATS+1159o5AuMxwlWmERLyYoZfILCrPI3UASLMaN7aIO0Udf+44NM6QGaNOUZntG8l9c/eUghKryOe2qmAq/408fHpS+ilu34j+nNuTeeD8UgLhrd7v9vpni/PVSM0hDIBaA4H7w== rsa-key-20180927"<br>}</pre> | no |
| <a name="input_instances"></a> [instances](#input\_instances) | Map of instances to be provisioned | `map(any)` | `{}` | no |
| <a name="input_private_key_path"></a> [private\_key\_path](#input\_private\_key\_path) | n/a | `string` | `"oci_private.pem"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-ashburn-1"` | no |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | n/a | `string` | `"ocid1.tenancy.oc1..aaaaaaaaplkmid2untpzjcxrmbv4nowe74yb4lr6idtckwo4wyf7jh23be4q"` | no |
| <a name="input_user_ocid"></a> [user\_ocid](#input\_user\_ocid) | n/a | `string` | `"ocid1.user.oc1..aaaaaaaacukozvprgq2ruhf255z3qhuwywh6kyb27dffa6zetesiv3jsleja"` | no |
| <a name="input_vcn_log_groups"></a> [vcn\_log\_groups](#input\_vcn\_log\_groups) | n/a | `map(any)` | `{}` | no |
| <a name="input_vcn_logs"></a> [vcn\_logs](#input\_vcn\_logs) | n/a | `map(any)` | `{}` | no |
| <a name="input_vlan_cidr_block"></a> [vlan\_cidr\_block](#input\_vlan\_cidr\_block) | n/a | `any` | n/a | yes |
| <a name="input_vlans"></a> [vlans](#input\_vlans) | n/a | `map(any)` | `{}` | no |


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_details"></a> [instance\_details](#output\_instance\_details) | n/a |
| <a name="output_vlan_tag"></a> [vlan\_tag](#output\_vlan\_tag) | n/a |
<!-- END_TF_DOCS -->