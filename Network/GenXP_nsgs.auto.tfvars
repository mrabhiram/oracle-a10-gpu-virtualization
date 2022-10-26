// Copyright (c) 2021, 2022, Oracle and/or its affiliates.
############################
# Network
# Network Security Group - tfvars
# Allowed Values:
# vcn_id can be the ocid or vcns map key
# compartment_id can be the ocid or the name of the compartment hierarchy delimited by double hiphens "--"
# Example : compartment_id = "ocid1.compartment.oc1..aaaaaaaahwwiefb56epvdlzfic6ah6jy3xf3c" or compartment_id = "Network-root-cpt--Network" where "Network-root-cpt" is the parent of "Network" compartment
############################
nsgs = {
  # NSG map #
  ##Add New NSGs for ashburn here##
  # Start of ashburn_IAD_NSG_VLAN #
  IAD_NSG_VLAN = {
    compartment_id = "Network"
    vcn_id         = "IAD_PROD_VCN"
    display_name   = "IAD_NSG_VLAN"
    defined_tags   = {}
    freeform_tags  = {}
  },
  # End of ashburn_IAD_NSG_VLAN #
  # Start of ashburn_IAD_NSG_VMs #
  IAD_NSG_VMs = {
    compartment_id = "Network"
    vcn_id         = "IAD_PROD_VCN"
    display_name   = "IAD_NSG_VMs"
    defined_tags   = {}
    freeform_tags  = {}
  },
  # End of ashburn_IAD_NSG_VMs #
  # Start of ashburn_IAD_NSG_BMs #
  IAD_NSG_BMs = {
    compartment_id = "Network"
    vcn_id         = "IAD_PROD_VCN"
    display_name   = "IAD_NSG_BMs"
    defined_tags   = {}
    freeform_tags  = {}
  },
  # End of ashburn_IAD_NSG_BMs #
}