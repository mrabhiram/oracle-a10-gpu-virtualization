// Copyright (c) 2021, 2022, Oracle and/or its affiliates.

############################
#
# Variables Block
# OCI
#
############################

variable "tenancy_ocid" {
  type    = string
  default = "ocid1.tenancy.oc1..aaaaaaaae42wmdy3jjh3edy5ndzvaseabbrxkh25hjrhdwkle5begqqdjbzq"
}
variable "region" {
  type    = string
  default = "us-ashburn-1"
}

#################################
#
# Variables according to Services
# PLEASE DO NOT MODIFY
#
#################################

##########################
## Fetch Compartments ####
##########################

#START_compartment_ocids#
variable "compartment_ocids" {
  type = map(any)
  default = {

    ManagedCompartmentForPaaS = "ocid1.compartment.oc1..aaaaaaaab5bazhbcu3soo5kaexkvmoywm2fttp7yt46qkaxgtpipjmuxjk4q",
    root                      = "ocid1.tenancy.oc1..aaaaaaaae42wmdy3jjh3edy5ndzvaseabbrxkh25hjrhdwkle5begqqdjbzq",
    Network                   = "ocid1.compartment.oc1..aaaaaaaa4thtq42lwpqo6rcm6undudg3k4h4tgpmlubssgfrya6ysltbdcoq",
    Production                = "ocid1.compartment.oc1..aaaaaaaalasgiuui7qauragkwm5er5mkpy6zkwn2oofw7vaqyc4nxnr3shcq",
    Security                  = "ocid1.compartment.oc1..aaaaaaaahxr4u6vp3kytkld6eg2xbtdo235jcqo7ea737fabaolho2hzvcka",
    Testing                   = "ocid1.compartment.oc1..aaaaaaaayvpal43jdti3azxvfwtbepg2xjsbbx5tromjyziq3lnui64bkcnq"
  }
}



variable "ManagedCompartmentForPaaS" {
  type    = string
  default = "ocid1.compartment.oc1..aaaaaaaab5bazhbcu3soo5kaexkvmoywm2fttp7yt46qkaxgtpipjmuxjk4q"
}




variable "root" {
  type    = string
  default = "ocid1.tenancy.oc1..aaaaaaaae42wmdy3jjh3edy5ndzvaseabbrxkh25hjrhdwkle5begqqdjbzq"
}




variable "Network" {
  type    = string
  default = "ocid1.compartment.oc1..aaaaaaaa4thtq42lwpqo6rcm6undudg3k4h4tgpmlubssgfrya6ysltbdcoq"
}




variable "Production" {
  type    = string
  default = "ocid1.compartment.oc1..aaaaaaaalasgiuui7qauragkwm5er5mkpy6zkwn2oofw7vaqyc4nxnr3shcq"
}




variable "Security" {
  type    = string
  default = "ocid1.compartment.oc1..aaaaaaaahxr4u6vp3kytkld6eg2xbtdo235jcqo7ea737fabaolho2hzvcka"
}




variable "Testing" {
  type    = string
  default = "ocid1.compartment.oc1..aaaaaaaayvpal43jdti3azxvfwtbepg2xjsbbx5tromjyziq3lnui64bkcnq"
}


#compartment_ocids_END#


#########################
###### Network ##########
#########################

variable "default_dhcps" {
  type    = map(any)
  default = {}
}

variable "custom_dhcps" {
  type    = map(any)
  default = {}
}

variable "vcns" {
  type    = map(any)
  default = {}
}

variable "igws" {
  type    = map(any)
  default = {}
}

variable "sgws" {
  type    = map(any)
  default = {}
}

variable "ngws" {
  type    = map(any)
  default = {}
}

variable "lpgs" {
  type = map(any)
  default = {
    hub-lpgs      = {},
    spoke-lpgs    = {},
    peer-lpgs     = {},
    none-lpgs     = {},
    exported-lpgs = {},
  }
}

variable "drgs" {
  type    = map(any)
  default = {}
}

variable "seclists" {
  type    = map(any)
  default = {}
}

variable "default_seclists" {
  type    = map(any)
  default = {}
}

variable "route_tables" {
  type    = map(any)
  default = {}
}

variable "default_route_tables" {
  type    = map(any)
  default = {}
}

variable "nsgs" {
  type    = map(any)
  default = {}
}

variable "nsg_rules" {
  type    = map(any)
  default = {}
}

variable "subnets" {
  type    = map(any)
  default = {}
}

variable "drg_attachments" {
  type    = map(any)
  default = {}
}

variable "drg_route_tables" {
  type    = map(any)
  default = {}
}

variable "drg_route_rules" {
  type    = map(any)
  default = {}
}

variable "drg_route_distributions" {
  type    = map(any)
  default = {}
}

variable "drg_route_distribution_statements" {
  type    = map(any)
  default = {}
}

variable "data_drg_route_tables" {
  type    = map(any)
  default = {}
}

variable "data_drg_route_table_distributions" {
  type    = map(any)
  default = {}
}

#########################
##### IP Management #####
#########################

variable "public_ip_pools" {
  type    = map(any)
  default = {}
}

variable "private_ips" {
  type    = map(any)
  default = {}
}

variable "reserved_ips" {
  type    = map(any)
  default = {}
}

variable "vnic_attachments" {
  type    = map(any)
  default = {}
}

#########################
##### VCN Logs ##########
#########################

variable "vcn_log_groups" {
  type    = map(any)
  default = {}
}

variable "vcn_logs" {
  type    = map(any)
  default = {}
}

#########################
## Management Services ##
#########################

variable "alarms" {
  type    = map(any)
  default = {}
}

variable "events" {
  type    = map(any)
  default = {}
}

variable "notifications_topics" {
  type    = map(any)
  default = {}
}

variable "notifications_subscriptions" {
  type    = map(any)
  default = {}
}

# Add new variables here #
##########################

######################### END #########################
