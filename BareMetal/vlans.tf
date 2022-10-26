// Copyright (c) 2021, 2022, Oracle and/or its affiliates.

################################
# Module Block - Network
# Create VLANs
################################

locals {
  vcn_id = { for vlans, details in var.vlans : "vlans" => zipmap(data.oci_core_vcns.oci_vcns_vlan[vlans].virtual_networks.*.display_name, data.oci_core_vcns.oci_vcns_vlan[vlans].virtual_networks.*.id) }

  vcn_default_route_tables = { for vlans, details in var.vlans : "vlans" => zipmap(data.oci_core_vcns.oci_vcns_vlan[vlans].virtual_networks.*.display_name, data.oci_core_vcns.oci_vcns_vlan[vlans].virtual_networks.*.default_route_table_id) }

  vlans_route_table = { for vlans, details in var.vlans : "rts" => zipmap(data.oci_core_route_tables.route_tables[vlans].route_tables.*.display_name, data.oci_core_route_tables.route_tables[vlans].route_tables.*.id) }

}

data "oci_core_vcns" "oci_vcns_vlan" {
  #depends_on     = [module.vcns] # Uncomment to create Network and Instances together
  for_each       = var.vlans != null ? var.vlans : {}
  compartment_id = each.value.network_compartment_id != null ? (length(regexall("ocid1.compartment.oc1*", each.value.network_compartment_id)) > 0 ? each.value.network_compartment_id : var.compartment_ocids[each.value.network_compartment_id]) : var.compartment_ocids[each.value.network_compartment_id]
  display_name   = each.value.vcn_id
}

data "oci_core_route_tables" "route_tables" {
  for_each = var.vlans != null ? var.vlans : {}

  #Required
  compartment_id = each.value.network_compartment_id != null ? (length(regexall("ocid1.compartment.oc1*", each.value.network_compartment_id)) > 0 ? each.value.network_compartment_id : var.compartment_ocids[each.value.network_compartment_id]) : var.compartment_ocids[each.value.network_compartment_id]

  #Optional
  display_name = each.value.route_table_id
  vcn_id       = local.vcn_id.vlans[each.value.vcn_id]
}

module "vlans" {
  source   = "./modules/vlan"
  for_each = (var.vlans != null || var.vlans != {}) ? var.vlans : {}

  #depends_on = [module.vcns] # Uncomment to create VLANs along with Network

  #Required
  #cidr_block = each.value.cidr_block
  cidr_block             = var.vlan_cidr_block
  compartment_id         = each.value.compartment_id != null ? (length(regexall("ocid1.compartment.oc1*", each.value.compartment_id)) > 0 ? each.value.compartment_id : var.compartment_ocids[each.value.compartment_id]) : null
  network_compartment_id = each.value.network_compartment_id != null ? (length(regexall("ocid1.compartment.oc1*", each.value.network_compartment_id)) > 0 ? each.value.network_compartment_id : var.compartment_ocids[each.value.network_compartment_id]) : null

  #vcn_id = length(regexall("ocid1.vcn.oc1*", each.value.vcn_id)) > 0 ? each.value.vcn_id : merge(module.vcns.*...)[each.value.vcn_id]["vcn_tf_id"]

  vcn_id = length(regexall("ocid1.vcn.oc1*", each.value.vcn_id)) > 0 ? each.value.vcn_id : local.vcn_id.vlans[each.value.vcn_id]

  #Optional
  #availability_domain       = each.value.availability_domain
  #defined_tags  = each.value.defined_tags
  display_name = each.value.display_name != null ? join("_", [var.bm_prefix], [each.value.display_name]) : null
  #display_name = each.value.display_name != null ? each.value.display_name : null
  #freeform_tags = each.value.freeform_tags
  nsg_ids        = each.value.nsg_ids
  route_table_id = length(regexall("ocid1.routetable.oc1*", each.value.route_table_id)) > 0 ? each.value.route_table_id : (each.value.route_table_id == "" ? local.vcn_default_route_tables.vlans[each.value.route_table_id] : local.vlans_route_table.rts[each.value.route_table_id])

  #vlan_tag = each.value.vlan_tag
}

output "vlan_tag" {
  value = merge(module.vlans.*...)
}