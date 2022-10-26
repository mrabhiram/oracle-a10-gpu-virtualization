// Copyright (c) 2021, 2022, Oracle and/or its affiliates.

############################
# Outputs Block - Instance
# Create Instance and Boot Volume Backup Policy
############################

output "bm_instance_ocid" {
  value = oci_core_instance.instance.id
}

output "bm_instance_private_ip" {
  value = oci_core_instance.instance.private_ip
}

output "bm_instance_public_ip" {
  value = oci_core_instance.instance.public_ip
}

/*
################################
## Outputs Block - VNICs
## Create VNICs
################################

output "vnics_tf_id" {
  value = oci_core_vnic_attachment.vnic_attachment.id
}*/


output "vm_private_ips" {
  value = oci_core_private_ip.private_ip.*.ip_address
}


output "vm_public_ips" {
  value = oci_core_public_ip.public_ip.*.ip_address
}

output "bm_key_secrets_id" {
  value = flatten(data.oci_vault_secrets.secrets.secrets.*.id)
}