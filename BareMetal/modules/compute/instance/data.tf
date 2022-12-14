// Copyright (c) 2021, 2022, Oracle and/or its affiliates.

#############################
## Data Block - Instance
## Create Instance and Boot Volume Backup Policy
#############################

locals {
  nsg_ids = flatten(tolist([for nsg in var.nsg_ids : (length(regexall("ocid1.networksecuritygroup.oc1*", nsg)) > 0 ? [nsg] : data.oci_core_network_security_groups.network_security_groups[nsg].network_security_groups[*].id)]))

  ADs = [
    for ad in data.oci_identity_availability_domains.ads.availability_domains : ad.name
  ]

  shapes_config = {
    for shape in data.oci_core_shapes.present_ad.shapes : shape.name => {
      memory_in_gbs = shape.memory_in_gbs
      ocpus         = shape.ocpus
    }
  }

  gbs_for_vm = 24 / var.gbs_for_vm
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_id
}

data "oci_core_shapes" "present_ad" {
  compartment_id      = var.compartment_id
  availability_domain = var.availability_domain == "" ? element(local.ADs, 0) : var.availability_domain
}

data "oci_core_vcns" "oci_vcns_instances" {
  for_each       = { for vcn in var.vcn_names : vcn => vcn }
  compartment_id = var.network_compartment_id != null ? var.network_compartment_id : var.compartment_id
  display_name   = each.value
}

data "oci_core_dedicated_vm_hosts" "existing_vm_host" {
  count          = var.dedicated_vm_host_name != null ? 1 : 0
  compartment_id = var.compartment_id
  display_name   = var.dedicated_vm_host_name
  state          = "ACTIVE"
}

data "oci_core_network_security_groups" "network_security_groups" {
  for_each       = { for nsg in var.nsg_ids : nsg => nsg }
  compartment_id = var.network_compartment_id != null ? var.network_compartment_id : var.compartment_id
  display_name   = each.value
  vcn_id         = data.oci_core_vcns.oci_vcns_instances[var.vcn_names[0]].virtual_networks.*.id[0]
}

#data "oci_core_boot_volumes" "all_boot_volumes" {
#  depends_on = [oci_core_instance.instance]
#  count     = var.boot_tf_policy != "" ? 1 : 0
#  #Required
#  compartment_id = var.compartment_id
#  availability_domain =  var.availability_domain
#  filter {
#    name   = "display_name"
#    values = [join(" ", [var.display_name, "(Boot Volume)"])]
#  }
#  filter {
#    name = "state"
#    values = ["AVAILABLE"]
#  }
#}

data "oci_core_volume_backup_policies" "boot_vol_backup_policy" {
  count = var.boot_tf_policy != "" ? 1 : 0

  filter {
    name   = "display_name"
    values = [lower(var.boot_tf_policy)]
  }
}

data "oci_core_volume_backup_policies" "boot_vol_custom_policy" {
  count          = var.boot_tf_policy != "" ? 1 : 0
  compartment_id = local.policy_tf_compartment_id
  filter {
    name   = "display_name"
    values = [var.boot_tf_policy]
  }
}

// Copyright (c) 2021, 2022, Oracle and/or its affiliates.

#############################
## Data Block - VNICs
## Create VNIC
#############################
/*
locals {
  vnic_nsg_ids = flatten(tolist([for nsg in var.vnic_nsg_ids : (length(regexall("ocid1.networksecuritygroup.oc1*",nsg)) > 0 ? [nsg] : data.oci_core_network_security_groups.network_security_groups_vnics[nsg].network_security_groups[*].id)]))
}

data "oci_core_vcns" "oci_vcns_vnics" {
  for_each       = { for vcn in var.vnic_vcn_ids: vcn => vcn }
  compartment_id = var.vnic_network_compartment_id != null ? var.vnic_network_compartment_id : var.vnic_compartment_id
  display_name   = each.value
}

data "oci_core_network_security_groups" "network_security_groups_vnics" {
  for_each = {for nsg in var.vnic_nsg_ids: nsg => nsg }
  compartment_id = var.vnic_network_compartment_id != null ? var.vnic_network_compartment_id : var.vnic_compartment_id
  display_name   = each.value
  vcn_id = data.oci_core_vcns.oci_vcns_vnics[var.vcn_names[0]].virtual_networks.*.id[0]
}*/


############################
## Data for KMS Keys
############################

data "oci_vault_secrets" "secrets" {

  #Required
  compartment_id = var.secrets_compartment_id
  name           = var.secrets_name
  state          = "ACTIVE"
}

data "oci_secrets_secretbundle" "bundle" {
  secret_id = data.oci_vault_secrets.secrets.secrets.*.id[0]
}
