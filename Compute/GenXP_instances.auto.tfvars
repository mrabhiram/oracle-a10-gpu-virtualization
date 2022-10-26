// Copyright (c) 2021, 2022, Oracle and/or its affiliates.
############################
# Instances
# Instance - tfvars
# Allowed Values:
# vcn_name must be the name of the VCN as in OCI
# subnet_id can be the ocid of the subnet or the name as in OCI
# compartment_id and network_compartment_id can be the ocid or the name of the compartment hierarchy delimited by double hiphens "--"
# Example : compartment_id = "ocid1.compartment.oc1..aaaaaaaahwwiefb56epvdlzfic6ah6jy3xf3c" or compartment_id = "Network-root-cpt--Network" where "Network-root-cpt" is the parent of "Network" compartment
############################
instances = {
  watchtower = {
    availability_domain                        = 0
    compartment_id                             = "Production"
    shape                                      = "VM.Standard.E4.Flex"
    display_name                               = "watchtower"
    boot_volume_size_in_gbs                    = 128
    fault_domain                               = "FAULT-DOMAIN-1"
    dedicated_vm_host_id                       = null
    source_id                                  = "Ubuntu22_04"
    source_type                                = "image"
    network_compartment_id                     = "Network"
    vcn_name                                   = "IAD_PROD_VCN"
    subnet_id                                  = "IAD_PROD_PUBLIC_SUBNET"
    assign_public_ip                           = true
    private_ip                                 = null
    nsg_ids                                    = ["IAD_NSG_VMs"]
    ocpus                                      = "2"
    memory_in_gbs                              = 32
    capacity_reservation_id                    = null
    create_is_pv_encryption_in_transit_enabled = true
    update_is_pv_encryption_in_transit_enabled = null
    ssh_authorized_keys                        = "ssh_public_key"
    backup_policy                              = "Bronze"
    policy_compartment_id                      = ""
    defined_tags                               = {}
    freeform_tags                              = {}
  },
  pixelos = {
    availability_domain                        = 0
    compartment_id                             = "Production"
    shape                                      = "VM.Standard3.Flex"
    display_name                               = "pixelos"
    boot_volume_size_in_gbs                    = 256
    fault_domain                               = "FAULT-DOMAIN-1"
    dedicated_vm_host_id                       = null
    source_id                                  = "Ubuntu20_04"
    source_type                                = "image"
    network_compartment_id                     = "Network"
    vcn_name                                   = "IAD_PROD_VCN"
    subnet_id                                  = "IAD_PROD_PUBLIC_SUBNET"
    assign_public_ip                           = true
    private_ip                                 = null
    nsg_ids                                    = ["IAD_NSG_VMs"]
    ocpus                                      = "2"
    memory_in_gbs                              = 32
    capacity_reservation_id                    = null
    create_is_pv_encryption_in_transit_enabled = null
    update_is_pv_encryption_in_transit_enabled = null
    ssh_authorized_keys                        = "ssh_public_key"
    backup_policy                              = "Bronze"
    policy_compartment_id                      = ""
    defined_tags                               = {}
    freeform_tags                              = {}
  },
  ##Add New Instances for ashburn here##
}