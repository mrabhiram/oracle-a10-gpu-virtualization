// Copyright (c) 2021, 2022, Oracle and/or its affiliates.
############################
# Identity
# Policies - tfvars
# Allowed Values:
# compartment_id can be the ocid or the name of the compartment hierarchy delimited by double hiphens "--"
# Example : compartment_id = "ocid1.compartment.oc1..aaaaaaaahwwiefb56epvdlzfic6ah6jy3xf3c" or compartment_id = "Network-root-cpt--Network" where "Network-root-cpt" is the parent of "Network" compartment
############################
policies = {
  AnnouncementReaders-Policy = {
    name                = "AnnouncementReaders-Policy"
    compartment_id      = "root"
    policy_version_date = null
    policy_description  = "Policy allowing AnnouncementReaders group to audit tenancy"
    defined_tags        = {}
    freeform_tags       = {}
    policy_statements   = ["Allow group AnnouncementReaders to read announcements in tenancy", "Allow group AnnouncementReaders to use cloud-shell in tenancy"]
  },
  AuditorAccess-Policy = {
    name                = "AuditorAccess-Policy"
    compartment_id      = "root"
    policy_version_date = null
    policy_description  = "Policy allowing Auditors group to audit tenancy"
    defined_tags        = {}
    freeform_tags       = {}
    policy_statements   = ["Allow group Auditors to inspect all-resources in tenancy", "Allow group Auditors to read instances in tenancy", "Allow group Auditors to read load-balancers in tenancy", "Allow group Auditors to read buckets in tenancy", "Allow group Auditors to read nat-gateways in tenancy", "Allow group Auditors to read public-ips in tenancy", "Allow group Auditors to read file-family in tenancy", "Allow group Auditors to read instance-configurations in tenancy", "Allow Group Auditors to read network-security-groups in tenancy", "Allow Group Auditors to read resource-availability in tenancy", "Allow Group Auditors to read audit-events in tenancy", "Allow Group Auditors to use cloud-shell in tenancy", "Allow Group Auditors to read users in tenancy", "Allow Group Auditors to read vss-family in tenancy", "Allow Group Auditors to read usage-budgets in tenancy", "Allow Group Auditors to read usage-reports in tenancy"]
  },
  CostAdmins-Policy = {
    name                = "CostAdmins-Policy"
    compartment_id      = "root"
    policy_version_date = null
    policy_description  = "Policy allowing CostAdmins group to manage costing"
    defined_tags        = {}
    freeform_tags       = {}
    policy_statements   = ["Allow group CostAdmins to manage usage-report in tenancy", "Allow group CostAdmins to manage usage-budgets  in tenancy"]
  },
  CredentialAdmins-Policy = {
    name                = "CredentialAdmins-Policy"
    compartment_id      = "root"
    policy_version_date = null
    policy_description  = "Policy for Credential Admins Group"
    defined_tags        = {}
    freeform_tags       = {}
    policy_statements   = ["Allow group CredentialAdmins to inspect users in tenancy", "Allow group CredentialAdmins to inspect groups in tenancy", "Allow group CredentialAdmins to manage users in tenancy  where any {request.operation = 'ListApiKeys',request.operation = 'ListAuthTokens',request.operation = 'ListCustomerSecretKeys',request.operation = 'UploadApiKey',request.operation = 'DeleteApiKey',request.operation = 'UpdateAuthToken',request.operation = 'CreateAuthToken',request.operation = 'DeleteAuthToken',request.operation = 'CreateSecretKey',request.operation = 'UpdateCustomerSecretKey',request.operation = 'DeleteCustomerSecretKey',request.operation = 'UpdateUserCapabilities'}", "Allow group CredentialAdmins to use cloud-shell in tenancy"]
  },
  CloudGuardAccess-Policy = {
    name                = "CloudGuardAccess-Policy"
    compartment_id      = "root"
    policy_version_date = null
    policy_description  = "Policy for Cloud Guard to be able to review a tenancy"
    defined_tags        = {}
    freeform_tags       = {}
    policy_statements   = ["allow service cloudguard to read keys in tenancy", "allow service cloudguard to read compartments in tenancy", "allow service cloudguard to read tenancies in tenancy", "allow service cloudguard to read audit-events in tenancy", "allow service cloudguard to read compute-management-family in tenancy", "allow service cloudguard to read instance-family in tenancy", "allow service cloudguard to read virtual-network-family in tenancy", "allow service cloudguard to read volume-family in tenancy", "allow service cloudguard to read database-family in tenancy", "allow service cloudguard to read object-family in tenancy", "allow service cloudguard to read load-balancers in tenancy", "allow service cloudguard to read users in tenancy", "allow service cloudguard to read groups in tenancy", "allow service cloudguard to read policies in tenancy", "allow service cloudguard to read dynamic-groups in tenancy", "allow service cloudguard to read authentication-policies in tenancy", "allow service cloudguard to use network-security-groups in tenancy", "allow service cloudguard to read data-safe-family in tenancy", "allow service cloudguard to read autonomous-database-family in tenancy", "allow service cloudguard to read vaults in tenancy"]
  },
  IAMAdmins-Policy = {
    name                = "IAMAdmins-Policy"
    compartment_id      = "root"
    policy_version_date = null
    policy_description  = "Policy allowing IAMAdmins group to manage IAM resources in tenancy, except changing Administrators group assignments"
    defined_tags        = {}
    freeform_tags       = {}
    policy_statements   = ["Allow group IAMAdmins to manage policies in tenancy", "Allow group IAMAdmins to manage compartments in tenancy", "Allow group IAMAdmins to manage tag-defaults in tenancy", "Allow group IAMAdmins to manage tag-namespaces in tenancy", "Allow group IAMAdmins to manage orm-stacks in tenancy", "Allow group IAMAdmins to manage orm-jobs in tenancy", "Allow group IAMAdmins to manage orm-config-source-providers in tenancy", "Allow group IAMAdmins to inspect users in tenancy", "Allow group IAMAdmins to inspect groups in tenancy", "Allow group IAMAdmins to manage groups in tenancy where all {target.group.name != 'Administrators', target.group.name != 'CredentialAdmins'}", "Allow group IAMAdmins to inspect identity-providers in tenancy", "Allow group IAMAdmins to manage identity-providers in tenancy where any {request.operation = 'AddIdpGroupMapping', request.operation = 'DeleteIdpGroupMapping'}", "Allow group IAMAdmins to manage dynamic-groups in tenancy", "Allow group IAMAdmins to manage authentication-policies in tenancy", "Allow group IAMAdmins to manage network-sources in tenancy", "Allow group IAMAdmins to manage quota in tenancy", "Allow group IAMAdmins to read audit-events in tenancy", "Allow group IAMAdmins to use cloud-shell in tenancy"]
  },
  NetworkAdmins-Policy = {
    name                = "NetworkAdmins-Policy"
    compartment_id      = "root"
    policy_version_date = null
    policy_description  = "Policy allowing NetworkAdmins group to manage virtual-network-family in compartment Network"
    defined_tags        = {}
    freeform_tags       = {}
    policy_statements   = ["Allow group NetworkAdmins to read all-resources in compartment Network", "Allow group NetworkAdmins to manage virtual-network-family in compartment Network", "Allow group NetworkAdmins to manage dns in compartment Network", "Allow group NetworkAdmins to manage load-balancers in compartment Network", "Allow group NetworkAdmins to manage alarms in compartment Network", "Allow group NetworkAdmins to manage metrics in compartment Network", "Allow group NetworkAdmins to manage orm-stacks in compartment Network", "Allow group NetworkAdmins to manage orm-jobs in compartment Network", "Allow group NetworkAdmins to manage orm-config-source-providers in compartment Network", "Allow Group NetworkAdmins to read audit-events in compartment Network", "Allow Group NetworkAdmins to read vss-family in compartment Security", "Allow group NetworkAdmins to read work-requests in compartment Network", "Allow group NetworkAdmins to use bastion in compartment Security", "Allow group NetworkAdmins to manage bastion-session in compartment Network", "Allow group NetworkAdmins to manage bastion-session in compartment Security", "Allow group NetworkAdmins to manage cloudevents-rules in compartment Network", "Allow group NetworkAdmins to manage instance-family in compartment Network", "Allow group NetworkAdmins to read instance-agent-plugins in compartment Network", "Allow group NetworkAdmins to use cloud-shell in tenancy", "Allow Group NetworkAdmins to read usage-budgets in tenancy", "Allow Group NetworkAdmins to read usage-reports in tenancy", "Allow group NetworkAdmins to use tag-namespaces in tenancy"]
  },
  OS-ManagementAcess-Policy = {
    name                = "OS-ManagementAcess-Policy"
    compartment_id      = "root"
    policy_version_date = null
    policy_description  = "Policy to allow the OS Management service permission to read instance information in the tenancy"
    defined_tags        = {}
    freeform_tags       = {}
    policy_statements   = ["Allow service osms to read instances in tenancy"]
  },
  ProductionAdmins-Policy = {
    name                = "ProductionAdmins-Policy"
    compartment_id      = "root"
    policy_version_date = null
    policy_description  = "Policy allowing ProductionAdmins group to manage app development related services, databases in compartment Production"
    defined_tags        = {}
    freeform_tags       = {}
    policy_statements   = ["Allow group ProductionAdmins to read all-resources in compartment Production", "Allow group ProductionAdmins to manage functions-family in compartment Production", "Allow group ProductionAdmins to manage api-gateway-family in compartment Production", "Allow group ProductionAdmins to manage ons-family in compartment Production", "Allow group ProductionAdmins to manage streams in compartment Production", "Allow group ProductionAdmins to manage cluster-family in compartment Production", "Allow group ProductionAdmins to manage alarms in compartment Production", "Allow group ProductionAdmins to manage metrics in compartment Production", "Allow group ProductionAdmins to manage logs in compartment Production", "Allow group ProductionAdmins to manage instance-family in compartment Production", "Allow group ProductionAdmins to manage volume-family in compartment Production", "Allow group ProductionAdmins to manage object-family in compartment Production", "Allow group ProductionAdmins to read virtual-network-family in compartment Network", "Allow group ProductionAdmins to use subnets in compartment Network", "Allow group ProductionAdmins to use network-security-groups in compartment Network", "Allow group ProductionAdmins to use vnics in compartment Network", "Allow group ProductionAdmins to use load-balancers in compartment Network", "Allow group ProductionAdmins to read vaults in compartment Security", "Allow group ProductionAdmins to inspect keys in compartment Security", "Allow group ProductionAdmins to read app-catalog-listing in tenancy", "Allow group ProductionAdmins to manage instance-images in compartment Security", "Allow group ProductionAdmins to read instance-images in tenancy", "Allow group ProductionAdmins to manage repos in compartment Production", "Allow group ProductionAdmins to read repos in tenancy", "Allow group ProductionAdmins to manage orm-stacks in compartment Production", "Allow group ProductionAdmins to manage orm-jobs in compartment Production", "Allow group ProductionAdmins to manage orm-config-source-providers in compartment Production", "Allow Group ProductionAdmins to read audit-events in compartment Production", "Allow group ProductionAdmins to read vss-family in compartment Security", "Allow group ProductionAdmins to read work-requests in compartment Production", "Allow group ProductionAdmins to use bastion in compartment Security", "Allow group ProductionAdmins to manage bastion-session in compartment Production", "Allow group ProductionAdmins to manage bastion-session in compartment Security", "Allow group ProductionAdmins to manage cloudevents-rules in compartment Production", "Allow group ProductionAdmins to manage alarms in compartment Production", "Allow group ProductionAdmins to manage metrics in compartment Production", "Allow group ProductionAdmins to read instance-agent-plugins in compartment Production", "Allow Group ProductionAdmins to use cloud-shell in tenancy", "Allow Group ProductionAdmins to read usage-budgets in tenancy", "Allow Group ProductionAdmins to read usage-reports in tenancy", "Allow group ProductionAdmins to manage database-family in compartment Production", "Allow group ProductionAdmins to manage autonomous-database-family in compartment Production", "Allow group ProductionAdmins to use vnics in compartment Production", "Allow group ProductionAdmins to use subnets in compartment Production", "Allow group ProductionAdmins to use network-security-groups in compartment Production", "Allow group ProductionAdmins to read vss-family in compartment Production", "Allow group ProductionAdmins to use tag-namespaces in tenancy"]
  },
  SecurityAdmins-Policy = {
    name                = "SecurityAdmins-Policy"
    compartment_id      = "root"
    policy_version_date = null
    policy_description  = "Policy allowing SecurityAdmins group to manage security related services in compartment Security"
    defined_tags        = {}
    freeform_tags       = {}
    policy_statements   = ["Allow group SecurityAdmins to manage tag-namespaces in tenancy", "Allow group SecurityAdmins to manage tag-defaults in tenancy", "Allow group SecurityAdmins to manage repos in tenancy", "Allow group SecurityAdmins to read audit-events in tenancy", "Allow group SecurityAdmins to read app-catalog-listing in tenancy", "Allow group SecurityAdmins to read instance-images in tenancy", "Allow group SecurityAdmins to inspect buckets in tenancy", "Allow group SecurityAdmins to read all-resources in compartment Security", "Allow group SecurityAdmins to manage instance-family in compartment Security", "Allow group SecurityAdmins to manage vaults in compartment Security", "Allow group SecurityAdmins to manage keys in compartment Security", "Allow group SecurityAdmins to manage secret-family in compartment Security", "Allow group SecurityAdmins to manage logging-family in compartment Security", "Allow group SecurityAdmins to manage serviceconnectors in compartment Security", "Allow group SecurityAdmins to manage streams in compartment Security", "Allow group SecurityAdmins to manage ons-family in compartment Security", "Allow group SecurityAdmins to manage functions-family in compartment Security", "Allow group SecurityAdmins to manage waas-family in compartment Security", "Allow group SecurityAdmins to manage security-zone in compartment Security", "Allow group SecurityAdmins to read virtual-network-family in compartment Network", "Allow group SecurityAdmins to use subnets in compartment Network", "Allow group SecurityAdmins to use network-security-groups in compartment Network", "Allow group SecurityAdmins to use vnics in compartment Network", "Allow group SecurityAdmins to manage orm-stacks in compartment Security", "Allow group SecurityAdmins to manage orm-jobs in compartment Security", "Allow group SecurityAdmins to manage orm-config-source-providers in compartment Security", "Allow group SecurityAdmins to manage vss-family in compartment Security", "Allow group SecurityAdmins to read work-requests in compartment Security", "Allow group SecurityAdmins to manage bastion-family in compartment Security", "Allow group SecurityAdmins to manage cloudevents-rules in compartment Security", "Allow group SecurityAdmins to manage alarms in compartment Security", "Allow group SecurityAdmins to manage metrics in compartment Security", "Allow group SecurityAdmins to read instance-agent-plugins in compartment Security", "Allow group SecurityAdmins to manage cloudevents-rules in tenancy", "Allow group SecurityAdmins to manage cloud-guard-family in tenancy", "Allow group SecurityAdmins to read tenancies in tenancy", "Allow group SecurityAdmins to read objectstorage-namespaces in tenancy", "Allow group SecurityAdmins to use cloud-shell in tenancy", "Allow Group SecurityAdmins to read usage-budgets in tenancy", "Allow Group SecurityAdmins to read usage-reports in tenancy"]
  },
  NetworkViewers-Policy = {
    name                = "NetworkViewers-Policy"
    compartment_id      = "root"
    policy_version_date = null
    policy_description  = "Policy allowing NetworkViewers group to read all resources in compartment Network"
    defined_tags        = {}
    freeform_tags       = {}
    policy_statements   = ["Allow group NetworkViewers to read all-resources in compartment Network"]
  },
  ProductionViewers-Policy = {
    name                = "ProductionViewers-Policy"
    compartment_id      = "root"
    policy_version_date = null
    policy_description  = "Policy allowing ProductionViewers group to read all resources in compartment Production"
    defined_tags        = {}
    freeform_tags       = {}
    policy_statements   = ["Allow group ProductionViewers to read all-resources in compartment Production"]
  },
  SecurityViewers-Policy = {
    name                = "SecurityViewers-Policy"
    compartment_id      = "root"
    policy_version_date = null
    policy_description  = "Policy allowing SecurityViewers group to read all resources in compartment Security"
    defined_tags        = {}
    freeform_tags       = {}
    policy_statements   = ["Allow group SecurityViewers to read all-resources in compartment Security"]
  },
  TenancyViewers-Policy = {
    name                = "TenancyViewers-Policy"
    compartment_id      = "root"
    policy_version_date = null
    policy_description  = "Policy allowing TenancyViewers group to read all resources in tenancy"
    defined_tags        = {}
    freeform_tags       = {}
    policy_statements   = ["Allow group TenancyViewers to read all-resources in tenancy"]
  },
  InstancePrincipalDG-Policy = {
    name                = "InstancePrincipalDG-Policy"
    compartment_id      = "root"
    policy_version_date = null
    policy_description  = "Policy for InstancePrincipalDG group to  have the required privileges for the automation to work"
    defined_tags        = {}
    freeform_tags       = {}
    policy_statements   = ["Allow dynamic-group InstancePrincipalDG to use object-family in compartment Production where target.bucket.name='AutomationScripts'", "Allow dynamic-group InstancePrincipalDG to read virtual-network-family in compartment Network", "Allow dynamic-group InstancePrincipalDG to use secret-family in compartment Security where target.vault.id='ocid1.vault.oc1.iad.b5rpmuaaaadoo.abuwcljrrlqq6x4ythzjqur4qcddjzddq6velatinz3tneurhzyutzlqcu7q'", "Allow dynamic-group InstancePrincipalDG to read public-ips in compartment Production"]
  },
}