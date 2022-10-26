// Copyright (c) 2021, 2022, Oracle and/or its affiliates.
############################
# Network
# Major Objects - VCNs, IGW, NGW, SGW, LPG, DRG - tfvars
# Allowed Values:
# compartment_id can be the ocid or the name of the compartment hierarchy delimited by double hiphens "--"
# Example : compartment_id = "ocid1.compartment.oc1..aaaaaaaahwwiefb56epvdlzfic6ah6jy3xf3c" or compartment_id = "Network-root-cpt--Network" where "Network-root-cpt" is the parent of "Network" compartment
############################
vcns = {
  IAD_PROD_VCN = {
    compartment_id = "Network"
    cidr_blocks    = ["10.10.0.0/16"]
    display_name   = "IAD_PROD_VCN"
    dns_label      = "iadprodvcn"
    is_ipv6enabled = "false"
    defined_tags   = {}
    freeform_tags  = {}
  },
}
############################
# Network
# Major Objects - IGW - tfvars
# Allowed Values:
# vcn_id can be the ocid or the key of vcns (map)
# compartment_id can be the ocid or the name of the compartment hierarchy delimited by double hiphens "--"
# Example : compartment_id = "ocid1.compartment.oc1..aaaaaaaahwwiefb56epvdlzfic6ah6jy3xf3c" or compartment_id = "Network-root-cpt--Network" where "Network-root-cpt" is the parent of "Network" compartment
############################
igws = {
  IAD_PROD_VCN_IAD_PROD_VCN_igw = {
    compartment_id = "Network"
    vcn_id         = "IAD_PROD_VCN"
    igw_name       = "IAD_PROD_VCN_igw"
    enable_igw     = "true"
    defined_tags   = {}
    freeform_tags  = {}
  },
}
############################
# Network
# Major Objects - NGW - tfvars
# Allowed Values:
# vcn_id can be the ocid or the key of vcns (map)
# compartment_id can be the ocid or the name of the compartment hierarchy delimited by double hiphens "--"
# Example : compartment_id = "ocid1.compartment.oc1..aaaaaaaahwwiefb56epvdlzfic6ah6jy3xf3c" or compartment_id = "Network-root-cpt--Network" where "Network-root-cpt" is the parent of "Network" compartment
############################
ngws = {
}
############################
# Network
# Major Objects - SGW - tfvars
# Allowed Values:
# vcn_id can be the ocid or the key of vcns (map)
# compartment_id can be the ocid or the name of the compartment hierarchy delimited by double hiphens "--"
# Example : compartment_id = "ocid1.compartment.oc1..aaaaaaaahwwiefb56epvdlzfic6ah6jy3xf3c" or compartment_id = "Network-root-cpt--Network" where "Network-root-cpt" is the parent of "Network" compartment
############################
sgws = {
  IAD_PROD_VCN_IAD_PROD_VCN_sgw = {
    compartment_id = "Network"
    vcn_id         = "IAD_PROD_VCN"
    sgw_name       = "IAD_PROD_VCN_sgw"
    # Possible values for service: "", "all", "objectstorage"
    service       = ""
    defined_tags  = {}
    freeform_tags = {}
  },
}
############################
# Network
# Major Objects - LPG - tfvars
# Allowed Values:
# vcn_id can be the ocid or the key of vcns (map)
# compartment_id can be the ocid or the name of the compartment hierarchy delimited by double hiphens "--"
# Example : compartment_id = "ocid1.compartment.oc1..aaaaaaaahwwiefb56epvdlzfic6ah6jy3xf3c" or compartment_id = "Network-root-cpt--Network" where "Network-root-cpt" is the parent of "Network" compartment
############################
lpgs = {
  hub-lpgs = {
  },
  spoke-lpgs = {
  },
  peer-lpgs = {
  },
  none-lpgs = {
  },
  exported-lpgs = {
  },
}