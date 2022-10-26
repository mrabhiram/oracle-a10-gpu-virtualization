// Copyright (c) 2021, 2022, Oracle and/or its affiliates.
############################
# Network
# Network Security Group Rules
# Allowed Values:
# nsg_id can be ocid or the key of nsgs (map)
############################
nsg_rules = {
  # NSG Rule map #
  ##Add New NSG Rules for ashburn here##
  IAD_NSG_VLAN_security_rule1 = {
    nsg_id           = "IAD_NSG_VLAN"
    direction        = "EGRESS"
    protocol         = "all"
    description      = "Egress rule for 0.0.0.0/0"
    stateless        = "false"
    source_type      = null
    destination_type = "CIDR_BLOCK"
    destination      = "0.0.0.0/0"
    source           = ""
    icmp_options = [{
      icmp_type = ""
      icmp_code = ""
    }]
    tcp_options = []
    udp_options = []
  },
  IAD_NSG_VLAN_security_rule2 = {
    nsg_id           = "IAD_NSG_VLAN"
    direction        = "INGRESS"
    protocol         = "all"
    description      = "Ingress rule for 0.0.0.0/0"
    stateless        = "false"
    source_type      = "CIDR_BLOCK"
    destination_type = null
    destination      = ""
    source           = "0.0.0.0/0"
    icmp_options = [{
      icmp_type = ""
      icmp_code = ""
    }]
    tcp_options = []
    udp_options = []
  },
  IAD_NSG_VMs_security_rule1 = {
    nsg_id           = "IAD_NSG_VMs"
    direction        = "INGRESS"
    protocol         = "all"
    description      = "Ingress rule for 0.0.0.0/0"
    stateless        = "false"
    source_type      = "CIDR_BLOCK"
    destination_type = null
    destination      = ""
    source           = "0.0.0.0/0"
    icmp_options = [{
      icmp_type = ""
      icmp_code = ""
    }]
    tcp_options = []
    udp_options = []
  },
  IAD_NSG_VMs_security_rule2 = {
    nsg_id           = "IAD_NSG_VMs"
    direction        = "EGRESS"
    protocol         = "all"
    description      = "Egress rule for 0.0.0.0/0"
    stateless        = "false"
    source_type      = null
    destination_type = "CIDR_BLOCK"
    destination      = "0.0.0.0/0"
    source           = ""
    icmp_options = [{
      icmp_type = ""
      icmp_code = ""
    }]
    tcp_options = []
    udp_options = []
  },
  IAD_NSG_BMs_security_rule1 = {
    nsg_id           = "IAD_NSG_BMs"
    direction        = "INGRESS"
    protocol         = "all"
    description      = "Ingress rule for 0.0.0.0/0"
    stateless        = "false"
    source_type      = "CIDR_BLOCK"
    destination_type = null
    destination      = ""
    source           = "0.0.0.0/0"
    icmp_options = [{
      icmp_type = ""
      icmp_code = ""
    }]
    tcp_options = []
    udp_options = []
  },
  IAD_NSG_BMs_security_rule2 = {
    nsg_id           = "IAD_NSG_BMs"
    direction        = "EGRESS"
    protocol         = "all"
    description      = "Egress rule for 0.0.0.0/0"
    stateless        = "false"
    source_type      = null
    destination_type = "CIDR_BLOCK"
    destination      = "0.0.0.0/0"
    source           = ""
    icmp_options = [{
      icmp_type = ""
      icmp_code = ""
    }]
    tcp_options = []
    udp_options = []
  },
}