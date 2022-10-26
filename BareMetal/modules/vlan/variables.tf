// Copyright (c) 2021, 2022, Oracle and/or its affiliates.

#################################
## Variables Block - VLANs
## Create VLANs
#################################

variable "freeform_tags" {
  description = "Free-form tags for the volume"
  type        = map(string)
  default     = {}
}

variable "network_compartment_id" {}

variable "defined_tags" {
  type    = map(any)
  default = {}
}

variable "display_name" {
  description = "User-friendly name to the volume"
  type        = string
}

variable "cidr_block" {
  description = "VLANs cidr_block"
  type        = string
  default     = null
}

variable "compartment_id" {
  type    = string
  default = null
}

variable "vcn_id" {
  type    = string
  default = null
}

variable "availability_domain" {
  type    = string
  default = null
}

variable "route_table_id" {
  type    = string
  default = null
}

variable "nsg_ids" {
  description = "A list of the OCIDs of the network security groups (NSGs) to add the VNIC to."
  type        = list(any)
  default     = []
}

variable "vlan_tag" {
  type    = string
  default = null
}
