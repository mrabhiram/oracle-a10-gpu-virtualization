// Copyright (c) 2021, 2022, Oracle and/or its affiliates.

#############################
## Module Block - Instances
## Create Instance
#############################

data "oci_core_subnets" "oci_subnets" {
  #depends_on     = [module.subnets] # Uncomment to create Network and Instances together
  for_each       = var.instances != null ? var.instances : {}
  compartment_id = each.value.network_compartment_id != null ? (length(regexall("ocid1.compartment.oc1*", each.value.network_compartment_id)) > 0 ? each.value.network_compartment_id : var.compartment_ocids[each.value.network_compartment_id]) : var.compartment_ocids[each.value.network_compartment_id]
  display_name   = each.value.subnet_id
  vcn_id         = data.oci_core_vcns.oci_vcns[each.key].virtual_networks.*.id[0]
}

data "oci_core_vcns" "oci_vcns" {
  #depends_on     = [module.vcns] # Uncomment to create Network and Instances together
  for_each       = var.instances != null ? var.instances : {}
  compartment_id = each.value.network_compartment_id != null ? (length(regexall("ocid1.compartment.oc1*", each.value.network_compartment_id)) > 0 ? each.value.network_compartment_id : var.compartment_ocids[each.value.network_compartment_id]) : var.compartment_ocids[each.value.network_compartment_id]
  display_name   = each.value.vcn_name
}

############################
# Resource Block - Identity
# Fetch Compartments
############################

#Fetch Compartment Details
data "oci_identity_compartments" "compartments" {
  #Required
  compartment_id = var.tenancy_ocid

  #Optional
  #name = var.compartment_name
  access_level              = "ANY"
  compartment_id_in_subtree = true
  state                     = "ACTIVE"
}


############################
# Data Block - Network
# Fetch ADs
############################

data "oci_identity_availability_domains" "availability_domains" {
  #Required
  compartment_id = var.tenancy_ocid
}


/*
output "compartment_id_map" {
  description = "Compartment ocid"
  // This allows the compartment ID to be retrieved from the resource if it exists, and if not to use the data source.
  value = zipmap(data.oci_identity_compartments.compartments.compartments.*.name,data.oci_identity_compartments.compartments.compartments.*.id)
}

output "ads" {
  value = data.oci_identity_availability_domains.availability_domains.availability_domains.*.name
}
*/