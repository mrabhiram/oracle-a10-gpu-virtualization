// Copyright (c) 2021, 2022, Oracle and/or its affiliates.
############################
# Network
# Major Objects - Route Table - tfvars
# Allowed Values:
# vcn_id can be the ocid or the key of vcns (map)
# compartment_id can be the ocid or the name of the compartment hierarchy delimited by double hiphens "--"
# Example : compartment_id = "ocid1.compartment.oc1..aaaaaaaahwwiefb56epvdlzfic6ah6jy3xf3c" or compartment_id = "Network-root-cpt--Network" where "Network-root-cpt" is the parent of "Network" compartment
############################
route_tables = {
  # Route Table map #
  # Start of #ashburn_IAD_PROD_VCN_IAD_PROD_PUBLIC_SUBNET_RT# #
  IAD_PROD_VCN_IAD_PROD_PUBLIC_SUBNET_RT = {
    compartment_id = "Network"
    vcn_id         = "IAD_PROD_VCN"
    display_name   = "IAD_PROD_PUBLIC_SUBNET_RT"
    route_rules_igw = [
      ## Start Route Rule ashburn_IAD_PROD_VCN_IAD_PROD_PUBLIC_SUBNET_RT_IAD_PROD_VCN_IAD_PROD_VCN_igw_0.0.0.0/0
      {
        network_entity_id = "IAD_PROD_VCN_IAD_PROD_VCN_igw"
        description       = ""
        destination       = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
      },
      ## End Route Rule ashburn_IAD_PROD_VCN_IAD_PROD_PUBLIC_SUBNET_RT_IAD_PROD_VCN_IAD_PROD_VCN_igw_0.0.0.0/0
      ####ADD_NEW_IGW_RULES #ashburn_IAD_PROD_VCN_IAD_PROD_PUBLIC_SUBNET_RT# ####
    ]
    route_rules_sgw = [
      ## Start Route Rule ashburn_IAD_PROD_VCN_IAD_PROD_PUBLIC_SUBNET_RT_IAD_PROD_VCN_IAD_PROD_VCN_sgw_objectstorage
      {
        network_entity_id = "IAD_PROD_VCN_IAD_PROD_VCN_sgw"
        description       = ""
        destination       = "objectstorage"
        destination_type  = "SERVICE_CIDR_BLOCK"
      },
      ## End Route Rule ashburn_IAD_PROD_VCN_IAD_PROD_PUBLIC_SUBNET_RT_IAD_PROD_VCN_IAD_PROD_VCN_sgw_objectstorage
      ####ADD_NEW_SGW_RULES #ashburn_IAD_PROD_VCN_IAD_PROD_PUBLIC_SUBNET_RT# ####
    ]
    route_rules_ngw = [
      ####ADD_NEW_NGW_RULES #ashburn_IAD_PROD_VCN_IAD_PROD_PUBLIC_SUBNET_RT# ####
    ]
    route_rules_drg = [
      ####ADD_NEW_DRG_RULES #ashburn_IAD_PROD_VCN_IAD_PROD_PUBLIC_SUBNET_RT# ####
    ]
    route_rules_lpg = [
      ####ADD_NEW_LPG_RULES #ashburn_IAD_PROD_VCN_IAD_PROD_PUBLIC_SUBNET_RT# ####
    ]
    route_rules_ip = [
      ####ADD_NEW_IP_RULES #ashburn_IAD_PROD_VCN_IAD_PROD_PUBLIC_SUBNET_RT# ####
    ]
    defined_tags  = {}
    freeform_tags = {}
  },
  # End of #ashburn_IAD_PROD_VCN_IAD_PROD_PUBLIC_SUBNET_RT# #
  ##Add New Route Tables for ashburn here##
  # Start of #ashburn_IAD_PROD_VCN_IAD_PROD_VLAN_RT# #
  IAD_PROD_VCN_IAD_PROD_VLAN_RT = {
    compartment_id = "Network"
    vcn_id         = "IAD_PROD_VCN"
    display_name   = "IAD_PROD_VLAN_RT"
    route_rules_igw = [
      ## Start Route Rule ashburn_IAD_PROD_VCN_IAD_PROD_VLAN_RT_IAD_PROD_VCN_IAD_PROD_VCN_igw_0.0.0.0/0
      {
        network_entity_id = "IAD_PROD_VCN_IAD_PROD_VCN_igw"
        description       = ""
        destination       = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
      },
      ## End Route Rule ashburn_IAD_PROD_VCN_IAD_PROD_VLAN_RT_IAD_PROD_VCN_IAD_PROD_VCN_igw_0.0.0.0/0
      ####ADD_NEW_IGW_RULES #ashburn_IAD_PROD_VCN_IAD_PROD_VLAN_RT# ####
    ]
    route_rules_sgw = [
      ## Start Route Rule ashburn_IAD_PROD_VCN_IAD_PROD_VLAN_RT_IAD_PROD_VCN_IAD_PROD_VCN_sgw_objectstorage
      {
        network_entity_id = "IAD_PROD_VCN_IAD_PROD_VCN_sgw"
        description       = ""
        destination       = "objectstorage"
        destination_type  = "SERVICE_CIDR_BLOCK"
      },
      ## End Route Rule ashburn_IAD_PROD_VCN_IAD_PROD_VLAN_RT_IAD_PROD_VCN_IAD_PROD_VCN_sgw_objectstorage
      ####ADD_NEW_SGW_RULES #ashburn_IAD_PROD_VCN_IAD_PROD_PUBLIC_SUBNET_RT# ####
    ]
    route_rules_ngw = [
      ####ADD_NEW_NGW_RULES #ashburn_IAD_PROD_VCN_IAD_PROD_VLAN_RT# ####
    ]
    route_rules_drg = [
      ####ADD_NEW_DRG_RULES #ashburn_IAD_PROD_VCN_IAD_PROD_VLAN_RT# ####
    ]
    route_rules_lpg = [
      ####ADD_NEW_LPG_RULES #ashburn_IAD_PROD_VCN_IAD_PROD_VLAN_RT# ####
    ]
    route_rules_ip = [
      ####ADD_NEW_IP_RULES #ashburn_IAD_PROD_VCN_IAD_PROD_VLAN_RT# ####
    ]
    defined_tags  = {}
    freeform_tags = {}
  },
  # End of #ashburn_IAD_PROD_VCN_IAD_PROD_VLAN_RT# #
}