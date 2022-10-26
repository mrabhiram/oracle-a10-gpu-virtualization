// Copyright (c) 2021, 2022, Oracle and/or its affiliates.
############################
# Identity
# Groups - tfvars
############################
groups = {
  AnnouncementReaders = {
    group_name        = "AnnouncementReaders"
    group_description = "Group responsible for Console Announcements"
    matching_rule     = "" # Can be null or "" for regular groups
    defined_tags      = {}
    freeform_tags     = {}
  },
  Auditors = {
    group_name        = "Auditors"
    group_description = "Group responsible for Auditing the tenancy"
    matching_rule     = "" # Can be null or "" for regular groups
    defined_tags      = {}
    freeform_tags     = {}
  },
  CostAdmins = {
    group_name        = "CostAdmins"
    group_description = "Group responsible for Cost Management"
    matching_rule     = "" # Can be null or "" for regular groups
    defined_tags      = {}
    freeform_tags     = {}
  },
  CredentialAdmins = {
    group_name        = "CredentialAdmins"
    group_description = "Group responsible for managing users credentials in the tenancy"
    matching_rule     = "" # Can be null or "" for regular groups
    defined_tags      = {}
    freeform_tags     = {}
  },
  IAMAdmins = {
    group_name        = "IAMAdmins"
    group_description = "Group responsible for managing IAM resources in the tenancy"
    matching_rule     = "" # Can be null or "" for regular groups
    defined_tags      = {}
    freeform_tags     = {}
  },
  NetworkAdmins = {
    group_name        = "NetworkAdmins"
    group_description = "Group responsible for managing networking in compartment Network"
    matching_rule     = "" # Can be null or "" for regular groups
    defined_tags      = {}
    freeform_tags     = {}
  },
  ProductionAdmins = {
    group_name        = "ProductionAdmins"
    group_description = "Group responsible for managing app development related services, databases in compartment Production"
    matching_rule     = "" # Can be null or "" for regular groups
    defined_tags      = {}
    freeform_tags     = {}
  },
  SecurityAdmins = {
    group_name        = "SecurityAdmins"
    group_description = "Group responsible for managing security services in compartment Security"
    matching_rule     = "" # Can be null or "" for regular groups
    defined_tags      = {}
    freeform_tags     = {}
  },
  NetworkViewers = {
    group_name        = "NetworkViewers"
    group_description = "Group that can read all resources in compartment Network"
    matching_rule     = "" # Can be null or "" for regular groups
    defined_tags      = {}
    freeform_tags     = {}
  },
  ProductionViewers = {
    group_name        = "ProductionViewers"
    group_description = "Group that can read all resources in compartment Production"
    matching_rule     = "" # Can be null or "" for regular groups
    defined_tags      = {}
    freeform_tags     = {}
  },
  SecurityViewers = {
    group_name        = "SecurityViewers"
    group_description = "Group that can read all resources in compartment Security"
    matching_rule     = "" # Can be null or "" for regular groups
    defined_tags      = {}
    freeform_tags     = {}
  },
  TenancyViewers = {
    group_name        = "TenancyViewers"
    group_description = "Group having read only access to entire tenancy"
    matching_rule     = "" # Can be null or "" for regular groups
    defined_tags      = {}
    freeform_tags     = {}
  },
  InstancePrincipalDG = {
    group_name        = "InstancePrincipalDG"
    group_description = "Dynamic Group to allow the BM instance to access OCI services- Key Vault, Object Storage"
    matching_rule     = "Any {instance.compartment.id = 'ocid1.compartment.oc1..aaaaaaaalasgiuui7qauragkwm5er5mkpy6zkwn2oofw7vaqyc4nxnr3shcq'}" # Can be null or "" for regular groups
    defined_tags      = {}
    freeform_tags     = {}
  },
}