// Copyright (c) 2021, 2022, Oracle and/or its affiliates.
############################
# Security
# Create KMS Vault and Key
# Allowed Values:
# compartment_id and network_compartment_id can be the ocid or the name of the compartment hierarchy delimited by double hiphens "--"
# Example : compartment_id = "ocid1.compartment.oc1..aaaaaaaahwwiefb56epvdlzfic6ah6jy3xf3c" or compartment_id = "Network-root-cpt--Network" where "Network-root-cpt" is the parent of "Network" compartment
############################
vaults = {
  GenXP-Vault = {
    compartment_id = "Security"
    display_name   = "GenXP-Vault"
    vault_type     = "DEFAULT"
    defined_tags   = {}
    freeform_tags  = {}
  },
  ##Add New Vaults for phoenix here##
}
// Copyright (c) 2021, 2022, Oracle and/or its affiliates.
############################
# Security
# Create KMS Vault and Key
# Allowed Values:
# compartment_id and network_compartment_id can be the ocid or the name of the compartment hierarchy delimited by double hiphens "--"
# Example : compartment_id = "ocid1.compartment.oc1..aaaaaaaahwwiefb56epvdlzfic6ah6jy3xf3c" or compartment_id = "Network-root-cpt--Network" where "Network-root-cpt" is the parent of "Network" compartment
# length : AES: 16, 24, or 32, RSA: 256, 384, or 512, ECDSA: 32, 48, or 66
############################
keys = {
  GenXP-MasterEncryptionKey = {
    compartment_id      = "Security"
    display_name        = "GenXP-MasterEncryptionKey"
    management_endpoint = "GenXP-Vault"
    algorithm           = "AES"
    length              = "32"
    protection_mode     = "SOFTWARE"
    defined_tags        = {}
    freeform_tags       = {}
  },
  ##Add New Keys for phoenix here##
}
