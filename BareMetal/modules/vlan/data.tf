// Copyright (c) 2021, 2022, Oracle and/or its affiliates.

#############################
## Data Block - VLANs
## Create VLANs
#############################

locals {
  nsg_ids = flatten(tolist([for nsg in var.nsg_ids : (length(regexall("ocid1.networksecuritygroup.oc1*", nsg)) > 0 ? [nsg] : data.oci_core_network_security_groups.network_security_groups_vlan[nsg].network_security_groups[*].id)]))
}

/*
data "oci_core_vcns" "oci_vcns_vlan" {
  compartment_id = var.network_compartment_id != null ? var.network_compartment_id : var.compartment_id
  display_name   = var.display_name
}*/

data "oci_core_network_security_groups" "network_security_groups_vlan" {
  for_each       = { for nsg in var.nsg_ids : nsg => nsg }
  compartment_id = var.network_compartment_id != null ? var.network_compartment_id : var.compartment_id
  display_name   = each.value
  vcn_id         = var.vcn_id
}
