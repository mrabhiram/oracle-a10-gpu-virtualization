// Copyright (c) 2021, 2022, Oracle and/or its affiliates.
############################
# Network
# Major Objects - Security List - tfvars
# Allowed Values:
# vcn_id can be the ocid or the key of vcns (map)
# compartment_id can be the ocid or the name of the compartment hierarchy delimited by double hiphens "--"
# Example : compartment_id = "ocid1.compartment.oc1..aaaaaaaahwwiefb56epvdlzfic6ah6jy3xf3c" or compartment_id = "Network-root-cpt--Network" where "Network-root-cpt" is the parent of "Network" compartment
############################
seclists = {
  # Seclist map #
  # Start of #ashburn_IAD_PROD_VCN_IAD_PROD_PUBLIC_SUBNET_SL01# #
  IAD_PROD_VCN_IAD_PROD_PUBLIC_SUBNET_SL01 = {
    compartment_id = "Network"
    vcn_id         = "IAD_PROD_VCN"
    display_name   = "IAD_PROD_PUBLIC_SUBNET_SL01"
    ingress_sec_rules = [
      ####ADD_NEW_INGRESS_SEC_RULES #ashburn_IAD_PROD_VCN_IAD_PROD_PUBLIC_SUBNET_SL01# ####
    ]
    egress_sec_rules = [
      {
        protocol         = "all"
        destination      = "0.0.0.0/0"
        description      = ""
        stateless        = false
        destination_type = ""
        icmp_options = [{
          icmp_options_type = ""
          icmp_options_code = ""
        }]
        udp_options = []
        tcp_options = []
      },
      ####ADD_NEW_EGRESS_SEC_RULES #ashburn_IAD_PROD_VCN_IAD_PROD_PUBLIC_SUBNET_SL01# ####
    ]
    defined_tags  = {}
    freeform_tags = {}
  },
  # End of #ashburn_IAD_PROD_VCN_IAD_PROD_PUBLIC_SUBNET_SL01# #
  ##Add New Seclists for ashburn here##
}