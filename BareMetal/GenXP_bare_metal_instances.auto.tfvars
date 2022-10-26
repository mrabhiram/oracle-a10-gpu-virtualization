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
  baremetalinstance01 = {
    availability_domain                        = 1
    compartment_id                             = "Production"
    shape                                      = "BM.GPU.T1.2"
    display_name                               = "baremetalinstance"
    boot_volume_size_in_gbs                    = 4352
    fault_domain                               = "FAULT-DOMAIN-1"
    dedicated_vm_host_id                       = null
    source_id                                  = "Linux8"
    source_type                                = "image"
    network_compartment_id                     = "Network"
    vcn_name                                   = "IAD_PROD_VCN"
    subnet_id                                  = "IAD_PROD_PUBLIC_SUBNET"
    assign_public_ip                           = true
    private_ip                                 = ""
    nsg_ids                                    = ["IAD_NSG_BMs"]
    ocpus                                      = "32"
    hostname_label                             = ""
    memory_in_gbs                              = "1024"
    capacity_reservation_id                    = null
    create_is_pv_encryption_in_transit_enabled = null
    update_is_pv_encryption_in_transit_enabled = null
    ssh_authorized_keys                        = "ssh_public_key"
    backup_policy                              = ""
    policy_compartment_id                      = ""
    defined_tags                               = {}
    freeform_tags                              = {}

    # VLAN attachment details 
    vlan_id           = "IAD_PROD_VLAN" # Same value as the Display Name. Use underscore between words
    vnic_display_name = "baremetalinstance_vnic"

    # Public IP config details
    lifetime = "RESERVED" # Allowed values - EPHEMERAL, RESERVED

    # Secrets
    secrets_compartment_id = "Security"
    secrets_name           = "bm-ssh-key"
  },
  ##Add New Instances for ashburn here##
}


