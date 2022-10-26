// Copyright (c) 2021, 2022, Oracle and/or its affiliates.

################################
## Resource Block - VLANs
## Create VLANs
################################

resource "oci_core_vlan" "vlan" {
  #Required
  cidr_block     = var.cidr_block
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id

  #Optional
  availability_domain = var.availability_domain
  defined_tags        = var.defined_tags
  display_name        = var.display_name
  freeform_tags       = var.freeform_tags
  nsg_ids             = var.nsg_ids == [] ? null : local.nsg_ids
  route_table_id      = var.route_table_id
  vlan_tag            = var.vlan_tag

  lifecycle {
    ignore_changes = [defined_tags["Oracle-Tags.CreatedOn"], defined_tags["Oracle-Tags.CreatedBy"], defined_tags["SE_Details.SE_Name"]]
  }
}