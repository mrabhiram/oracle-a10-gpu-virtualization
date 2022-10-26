############################
# Network
# VLANs - tfvars
# Allowed Values:
# vcn_name must be the name of the VCN as in OCI
# subnet_id can be the ocid of the subnet or the name as in OCI
# compartment_id and network_compartment_id can be the ocid or the name of the compartment hierarchy delimited by double hiphens "--"
# Example : compartment_id = "ocid1.compartment.oc1..aaaaaaaahwwiefb56epvdlzfic6ah6jy3xf3c" or compartment_id = "Network-root-cpt--Network" where "Network-root-cpt" is the parent of "Network" compartment
############################


vlans = {
  IAD_PROD_VLAN = { # Same value as the Display Name. Use underscore between words
    compartment_id         = "Network"
    network_compartment_id = "Network"
    vcn_id                 = "IAD_PROD_VCN"
    display_name           = "IAD_PROD_VLAN"
    nsg_ids                = ["IAD_NSG_VLAN"]
    route_table_id         = "IAD_PROD_VLAN_RT"
  },
}

