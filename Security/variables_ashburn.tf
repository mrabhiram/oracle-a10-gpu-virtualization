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
                root = "ocid1.tenancy.oc1..aaaaaaaae42wmdy3jjh3edy5ndzvaseabbrxkh25hjrhdwkle5begqqdjbzq",   
                Network = "ocid1.compartment.oc1..aaaaaaaa4thtq42lwpqo6rcm6undudg3k4h4tgpmlubssgfrya6ysltbdcoq",   
                Production = "ocid1.compartment.oc1..aaaaaaaalasgiuui7qauragkwm5er5mkpy6zkwn2oofw7vaqyc4nxnr3shcq",   
                Security = "ocid1.compartment.oc1..aaaaaaaahxr4u6vp3kytkld6eg2xbtdo235jcqo7ea737fabaolho2hzvcka",   
                Testing = "ocid1.compartment.oc1..aaaaaaaayvpal43jdti3azxvfwtbepg2xjsbbx5tromjyziq3lnui64bkcnq"   
            }
}



variable "ManagedCompartmentForPaaS" {
            type = string
            default = "ocid1.compartment.oc1..aaaaaaaab5bazhbcu3soo5kaexkvmoywm2fttp7yt46qkaxgtpipjmuxjk4q"
}




variable "root" {
            type = string
            default = "ocid1.tenancy.oc1..aaaaaaaae42wmdy3jjh3edy5ndzvaseabbrxkh25hjrhdwkle5begqqdjbzq"
}




variable "Network" {
            type = string
            default = "ocid1.compartment.oc1..aaaaaaaa4thtq42lwpqo6rcm6undudg3k4h4tgpmlubssgfrya6ysltbdcoq"
}




variable "Production" {
            type = string
            default = "ocid1.compartment.oc1..aaaaaaaalasgiuui7qauragkwm5er5mkpy6zkwn2oofw7vaqyc4nxnr3shcq"
}




variable "Security" {
            type = string
            default = "ocid1.compartment.oc1..aaaaaaaahxr4u6vp3kytkld6eg2xbtdo235jcqo7ea737fabaolho2hzvcka"
}




variable "Testing" {
            type = string
            default = "ocid1.compartment.oc1..aaaaaaaayvpal43jdti3azxvfwtbepg2xjsbbx5tromjyziq3lnui64bkcnq"
}


#compartment_ocids_END#
############################
## Key Management Service ##
############################

variable "vaults" {
  type    = map(any)
  default = {}
}

variable "keys" {
  type    = map(any)
  default = {}
}

###########################
####### Cloud Guard #######
###########################

variable "cloud_guard_configs" {
  type    = map(any)
  default = {}
}

variable "cloud_guard_targets" {
  type    = map(any)
  default = {}
}

######################### END #########################
