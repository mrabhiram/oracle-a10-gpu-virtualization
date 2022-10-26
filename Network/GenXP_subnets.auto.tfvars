// Copyright (c) 2021, 2022, Oracle and/or its affiliates.
#############################
# Network
# Major Objects - Subnets - tfvars
# Allowed Values:
# vcn_id, route_table_id, dhcp_options_id can be the ocid or the key of vcns (map), route_tables (map) and dhcp_options (map) respectively
# security_list_ids can be a list of ocids or the key of security_lists (map)
# compartment_id can be the ocid or the name of the compartment hierarchy delimited by double hiphens "--"
# Example : compartment_id = "ocid1.compartment.oc1..aaaaaaaahwwiefb56epvdlzfic6ah6jy3xf3c" or compartment_id = "Network-root-cpt--Network" where "Network-root-cpt" is the parent of "Network" compartment
#############################
subnets = {
  # Subnets map #
  IAD_PROD_VCN_IAD_PROD_PUBLIC_SUBNET = {
    cidr_block                 = "10.10.0.0/24"
    compartment_id             = "Network"
    vcn_id                     = "IAD_PROD_VCN"
    display_name               = "IAD_PROD_PUBLIC_SUBNET"
    availability_domain        = ""
    prohibit_public_ip_on_vnic = "false"
    prohibit_internet_ingress  = ""
    route_table_id             = "IAD_PROD_VCN_IAD_PROD_PUBLIC_SUBNET_RT"
    dns_label                  = "iadprodpublicsn"
    dhcp_options_id            = "IAD_PROD_VCN_IAD_PROD_DHCP"
    security_list_ids          = ["IAD_PROD_VCN_IAD_PROD_PUBLIC_SUBNET_SL01"]
    ipv6cidr_block             = ""
    defined_tags               = {}
    freeform_tags              = {}
  },
  ##Add New Subnets for ashburn here##
}