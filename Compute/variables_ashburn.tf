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
# SSH Keys
#################################

variable "instance_ssh_keys" {
  type = map(any)
  default = {

    ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDPGrEzFuI+bTmH1iasrEFzX1WLrFdsh1ePk69/YsrA+QNRE6t8rXnY2JbwYHStIms3i+Xs+4Njy3I7iznFTye+gyCsuNoZNDtuBRdeHhI5pLsg05BhTPbfLaF63PxDJJ/iVa8idGfI9wdtxlK2chcQpu4Efkt3dQMegYYsL+PU/diVSPX+Kn97ltc8iJbFcBXbkfgzRX3UN2S5bn6v6DvDgvLTfTxPXxP1q5mEoaPNtNBKe86opzxPspSH8uIr5z00Btiv1o+wLnduC33nxQLzQ4CEzstjyg1NRd5z3qh+yuE8FSUxq9slbdo1u21ZTZTBLIoH9Q4JxKwZeSUuRuuH GenXP-BM-SSH-Key\nssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDVdnle0MSkopaLO4OrkUE1S9I8Wg6E6bedI/iYqnoWKHGV/HNbWv4oof/YdAYbjEh7By7y24Mbp/oDb63Y0FHdqUEpYWY6laVDoDVE683oewCCj/wqxRVjg4UtK9TlgPuYpuk6Or3ZZXSB1oV2IpumuuC7/TWDuZ354ivFR0AoVjRaZRYUCJRdgWoPCX0Rojn5SMkPGWOCwi0XL5q/OrLseoShghUKfMR0t2xSb1hMXMapvCjFjJQsjPc9qKsw+bNz+snjI2R4nYNOoJWJEpKWbxG6tvjFOGeLB6laKQsI8DSBxIFZYI9eEK6fodeInVZbuFd/0Eosp0p/OAUjz4yV tingh@calisto\nssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDG3L+PiWoM//3PBIi7cZhjYFwKjCEYyo2dgDGVJ+Q3apg/h9nUe2pncgapsDRdz183de1Dn/OyJGg839uaeJfOUZzin6munN9MH7pOh7+R7F1BU1eAoPIUG2BDYGajETRwuz09Y7fxPsV10OcYwVLeuTSfB7vACAl8bgmwWWROviJRN22Ci/4MuFKyU4gB8E7GyKQMR0FL/Wp4v3OKpxsAkHM+tyauvifsQ1BAF5urrHZjxWxoSm5FqkrCn60kRf4QUfqrAkjQOf/loSrRj349l9uHyqc0n8z25Yw8OIohr39MjsLe0z2mJH85oQLSKTVQTLa3o95Cuq/FK2c7DTFlN++CquVSgNFrUEQ3lrgw6Xek1VeKFyoP/yYVvjSy6FGzAbJ4TeiuOMOlVIb+WaTBrssW8034p/mquRRnxDSAhydTUSo51ETS6qEHiMtH4+RwElaplUcdxJOqMKgDYAw2MTwbNKMEqHLtMBDYeurCmlbu0YcNnHT8hXhZwxmJtk0= vince@DEVCOOL"
    #START_instance_ssh_keys#
    # exported instance ssh keys
    #instance_ssh_keys_END#
  }
}


#################################
# Platform Image OCIDs and
# Market Place Images
#################################

variable "instance_source_ocids" {
  type = map(any)
  default = {
    Linux       = "ocid1.image.oc1.iad.aaaaaaaa636rylf7lyhvlmj5iimahyeohqcdqdlroks3we2g5i4bsp4lohda"
    Windows     = "ocid1.image.oc1.iad.aaaaaaaa3kazyezsjl3k3bep73bpcyi33g7fpo6xmzz6gomzoub5mid7bi6a"
    PaloAlto    = "Palo Alto Networks VM-Series Next Generation Firewall"
    Ubuntu22_04 = "ocid1.image.oc1.iad.aaaaaaaa6qhihpfyaxwd5mnxw6s6w5k46r2ui3o75smnbx7vn77tbtvzljva"
    Ubuntu20_04 = "ocid1.image.oc1.iad.aaaaaaaa2zjkrjfmn2qv6mkcupitlf6ittlm7pjap5oi3oppsmtfbgkmxscq"
    #START_instance_source_ocids#
    # exported instance image ocids
    #instance_source_ocids_END#
  }
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
## Instances/Block Volumes ##
#########################

variable "blockvolumes" {
  type        = map(any)
  description = "To provision block volumes"
  default     = {}
}

variable "block_backup_policies" {
  type        = map(any)
  description = "To create block volume back policy"
  default     = {}
}

variable "instances" {
  type        = map(any)
  description = "Map of instances to be provisioned"
  default     = {}
}

variable "boot_backup_policies" {
  type        = map(any)
  description = "Map of boot volume backup policies to be provisioned"
  default     = {}
}


####################################
####### Custom Backup Policy #######
####################################

variable "custom_backup_policies" {
  type    = map(any)
  default = {}
}

##########################
# Add new variables here #
##########################

variable "capacity_reservation_ocids" {
  type = map(any)
  default = {
    "AD1" : "<AD1 Capacity Reservation OCID>",
    "AD2" : "<AD2 Capacity Reservation OCID>",
    "AD3" : "<AD3 Capacity Reservation OCID>"
  }
}

######################### END #########################
