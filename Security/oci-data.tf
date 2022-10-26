// Copyright (c) 2021, 2022, Oracle and/or its affiliates.

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

