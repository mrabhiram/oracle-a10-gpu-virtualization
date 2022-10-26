// Copyright (c) 2021, 2022, Oracle and/or its affiliates.
############################
# Identity
# Compartments - tfvars
# Allowed Values:
# parent_compartment_id can be the ocid or the name of the compartment hierarchy delimited by double hiphens "--"
# Example : parent_compartment_id = "ocid1.compartment.oc1..aaaaaaaahwwiefb56epvdlzfic6ah6jy3xf3c" or parent_compartment_id = "Network-root-cpt--Network" where "Network-root-cpt" is the parent of "Network" compartment
############################
compartments = {
  root = {
    Production = {
      parent_compartment_id = null
      name                  = "Production"
      description           = "Compartment for all resources related to application development, database related resources"
      enable_delete         = "false"
      defined_tags          = {}
      freeform_tags         = {}
    },
    Network = {
      parent_compartment_id = null
      name                  = "Network"
      description           = "Compartment for all network related resources: VCNs, subnets, network gateways, security lists, NSGs, load balancers, VNICs."
      enable_delete         = "false"
      defined_tags          = {}
      freeform_tags         = {}
    },
    Security = {
      parent_compartment_id = null
      name                  = "Security"
      description           = "Compartment for all security related resources: vaults."
      enable_delete         = "false"
      defined_tags          = {}
      freeform_tags         = {}
    },
  },
  compartment_level1 = {
  }
  compartment_level2 = {
  },
  compartment_level3 = {
  },
  compartment_level4 = {
  },
  compartment_level5 = {
  }
}