// Copyright (c) 2021, 2022, Oracle and/or its affiliates.
############################
# Network
# Custom DHCP - tfvars
# Allowed Values:
# vcn_id can be the ocid or the key of vcns (map)
# compartment_id can be the ocid or the name of the compartment hierarchy delimited by double hiphens "--"
# Example : compartment_id = "ocid1.compartment.oc1..aaaaaaaahwwiefb56epvdlzfic6ah6jy3xf3c" or compartment_id = "Network-root-cpt--Network" where "Network-root-cpt" is the parent of "Network" compartment
############################
custom_dhcps = {
  IAD_PROD_VCN_IAD_PROD_DHCP = {
    compartment_id     = "Network"
    server_type        = "VcnLocalPlusInternet"
    custom_dns_servers = []
    domain_name_type   = ""
    display_name       = "IAD_PROD_DHCP"
    vcn_id             = "IAD_PROD_VCN"
    search_domain = {
    }
    defined_tags  = {}
    freeform_tags = {}
  },
}