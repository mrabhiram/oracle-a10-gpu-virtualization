#// Copyright (c) 2021, 2022, Oracle and/or its affiliates.
#
#############################
## Resource Block - Instance
## Create Instance and Boot Volume Backup Policy
#############################

resource "oci_core_instance" "instance" {
  #Required
  availability_domain                 = var.availability_domain
  compartment_id                      = var.compartment_id
  capacity_reservation_id             = var.capacity_reservation_id
  shape                               = var.shape
  dedicated_vm_host_id                = var.dedicated_vm_host_name != null ? data.oci_core_dedicated_vm_hosts.existing_vm_host[0].dedicated_vm_hosts[0]["id"] : null
  defined_tags                        = var.defined_tags
  display_name                        = var.display_name
  extended_metadata                   = var.extended_metadata
  fault_domain                        = var.fault_domain
  freeform_tags                       = var.freeform_tags
  ipxe_script                         = var.ipxe_script
  is_pv_encryption_in_transit_enabled = var.create_is_pv_encryption_in_transit_enabled

  metadata = {
    ssh_authorized_keys = var.ssh_public_keys
  }

  preserve_boot_volume = var.preserve_boot_volume

  dynamic "preemptible_instance_config" {
    for_each = var.preemptible_instance_config
    content {
      #Required
      preemption_action {
        #Required
        type = preemptible_instance_config.value["action_type"]
        #Optional
        preserve_boot_volume = preemptible_instance_config.value["preserve_boot_volume"]
      }
    }
  }

  #Optional
  /* agent_config {
    #Optional
    are_all_plugins_disabled = var.all_plugins_disabled
    is_management_disabled   = var.is_management_disabled
    is_monitoring_disabled   = var.is_monitoring_disabled

    dynamic "plugins_config" {
      #Required
      for_each = var.plugins_details
      content {
        desired_state = plugins_config.value["desired_state"]
        name          = plugins_config.value["name"]
      }
    }
  }
  */

  availability_config {
    #Optional
    is_live_migration_preferred = var.is_live_migration_preferred
    recovery_action             = var.recovery_action
  }

  create_vnic_details {
    #Optional
    assign_private_dns_record = var.assign_private_dns_record
    assign_public_ip          = var.assign_public_ip
    defined_tags              = var.defined_tags
    display_name              = var.display_name
    freeform_tags             = var.freeform_tags
    hostname_label            = var.hostname_label
    nsg_ids                   = length(var.nsg_ids) != 0 ? (local.nsg_ids == [] ? ["INVALID NSG Name"] : local.nsg_ids) : null
    private_ip                = var.private_ip
    subnet_id                 = var.subnet_id
    vlan_id                   = var.vlan_id
    skip_source_dest_check    = var.skip_source_dest_check
  }

  instance_options {
    #Optional
    are_legacy_imds_endpoints_disabled = var.are_legacy_imds_endpoints_disabled
  }

  launch_options {
    #Optional
    boot_volume_type                    = var.boot_volume_type
    firmware                            = var.firmware
    is_consistent_volume_naming_enabled = var.is_consistent_volume_naming_enabled
    is_pv_encryption_in_transit_enabled = var.update_is_pv_encryption_in_transit_enabled
    network_type                        = var.network_type
    remote_data_volume_type             = var.remote_data_volume_type
  }

  dynamic "platform_config" {
    for_each = var.platform_config
    content {
      #Required
      type = platform_config.value["config_type"]
      #Optional
      is_measured_boot_enabled           = platform_config.value["is_measured_boot_enabled"]
      is_secure_boot_enabled             = platform_config.value["is_secure_boot_enabled"]
      is_trusted_platform_module_enabled = platform_config.value["is_trusted_platform_module_enabled"]
      numa_nodes_per_socket              = platform_config.value["numa_nodes_per_socket"]
    }
  }

  shape_config {
    #Optional
    baseline_ocpu_utilization = var.baseline_ocpu_utilization
    memory_in_gbs             = var.memory_in_gbs == null ? local.shapes_config[var.shape]["memory_in_gbs"] : var.memory_in_gbs
    ocpus                     = var.ocpu_count == null ? local.shapes_config[var.shape]["ocpus"] : var.ocpu_count
  }

  source_details {

    source_id   = var.source_image_id
    source_type = var.source_type
    #Optional
    boot_volume_size_in_gbs = var.boot_volume_size_in_gbs
    kms_key_id              = var.kms_key_id
  }

  lifecycle {
    ignore_changes        = [defined_tags["Oracle-Tags.CreatedOn"], defined_tags["SE_Details.SE_Name"], defined_tags["Oracle-Tags.CreatedBy"], create_vnic_details[0].defined_tags["Oracle-Tags.CreatedOn"], create_vnic_details[0].defined_tags["Oracle-Tags.CreatedBy"], create_vnic_details[0].defined_tags["SE_Details.SE_Name"], create_vnic_details[0].defined_tags["Schedule.AnyDay"], defined_tags["Schedule.AnyDay"]]
    create_before_destroy = false
  }
}

####################################
## Resource Boot Volume - Backup Policy
## Create Boot Volume Backup Policy
####################################

locals {
  policy_tf_compartment_id = var.policy_tf_compartment_id != "" ? var.policy_tf_compartment_id : ""
  current_policy_id        = var.boot_tf_policy != "" ? (lower(var.boot_tf_policy) == "gold" || lower(var.boot_tf_policy) == "silver" || lower(var.boot_tf_policy) == "bronze" ? data.oci_core_volume_backup_policies.boot_vol_backup_policy[0].volume_backup_policies.0.id : data.oci_core_volume_backup_policies.boot_vol_custom_policy[0].volume_backup_policies.0.id) : ""
}

resource "oci_core_volume_backup_policy_assignment" "volume_backup_policy_assignment" {
  depends_on = [oci_core_instance.instance]
  count      = var.boot_tf_policy != "" ? 1 : 0
  #asset_id  = data.oci_core_boot_volumes.all_boot_volumes[0].boot_volumes.0.id
  asset_id  = oci_core_instance.instance.boot_volume_id
  policy_id = local.current_policy_id
  lifecycle {
    create_before_destroy = true
  }
}

################################
## Resource Block - VNICs
## Create VNICs
################################

resource "oci_core_vnic_attachment" "vnic_attachment" {

  #Required
  create_vnic_details {

    #Optional
    assign_private_dns_record = var.vnic_assign_private_dns_record
    assign_public_ip          = var.vnic_assign_public_ip
    defined_tags              = var.defined_tags
    display_name              = var.vnic_display_name
    freeform_tags             = var.freeform_tags
    hostname_label            = var.vnic_hostname_label
    #nsg_ids =  var.vnic_nsg_ids == [] ? null : local.vnic_nsg_ids
    private_ip = var.vnic_private_ip
    #skip_source_dest_check = var.vnic_skip_source_dest_check
    #subnet_id = var.vnic_subnet_id
    vlan_id = var.vnic_vlan_id
  }
  instance_id = oci_core_instance.instance.id

  #Optional
  display_name = var.vnic_display_name
  nic_index    = var.nic_index

  lifecycle {
    ignore_changes = [create_vnic_details[0].defined_tags["Oracle-Tags.CreatedOn"], create_vnic_details[0].defined_tags["Oracle-Tags.CreatedBy"], create_vnic_details[0].defined_tags["Schedule.AnyDay"], create_vnic_details[0].defined_tags["SE_Details.SE_Name"]]
  }
}

#######################################
## Private IPs
#######################################

resource "oci_core_private_ip" "private_ip" {
  count = 48 / var.gbs_for_vm

  vlan_id = var.vnic_vlan_id

  #Optional
  defined_tags   = var.defined_tags
  display_name   = join("_", [var.private_ip_display_name], [count.index])
  freeform_tags  = var.freeform_tags
  hostname_label = var.private_ip_hostname_label
  #ip_address = cidrhost(var.vlan_cidr_block,count.index) --> uncomment for sequential IPs
  ip_address = var.private_ip_ip_address
  vnic_id    = var.private_ip_vnic_id

  lifecycle {
    ignore_changes = [defined_tags["Oracle-Tags.CreatedOn"], defined_tags["Oracle-Tags.CreatedBy"], defined_tags["Schedule.AnyDay"], defined_tags["SE_Details.SE_Name"]]
  }
}

#######################################
## Reserved IPs
#######################################

resource "oci_core_public_ip" "public_ip" {
  count = 48 / var.gbs_for_vm

  #Required
  compartment_id = var.compartment_id
  lifetime       = var.public_ip_lifetime

  #Optional
  defined_tags      = var.defined_tags
  display_name      = var.public_ip_display_name
  freeform_tags     = var.freeform_tags
  private_ip_id     = oci_core_private_ip.private_ip[count.index].id
  public_ip_pool_id = var.public_ip_pool_id
  lifecycle {
    ignore_changes = [defined_tags["Oracle-Tags.CreatedOn"], defined_tags["Oracle-Tags.CreatedBy"], defined_tags["Schedule.AnyDay"], defined_tags["SE_Details.SE_Name"]]
  }
}

####################################
## Remote Exec 01
####################################

resource "null_resource" "install_kvm_and_reboot" {
  depends_on = [oci_core_instance.instance]
  provisioner "remote-exec" {
    inline = [
      "# Install OCI CLI packages",
      "sudo dnf -y install oraclelinux-developer-release-el8",
      "sudo dnf -y install python36-oci-cli",
      "echo '================== Download image and drivers ====================='",
      "sudo oci os object bulk-download --bucket-name AutomationScripts --auth instance_principal --dest-dir /home/opc/vgaming",
      "cd /home/opc/vgaming/scripts/",
      "sudo chmod +x *.sh",
      "ls -ltra",
      "./install_packages_in_baremetal.sh",
    ]

    on_failure = continue


    connection {
      type        = "ssh"
      user        = "opc"
      private_key = base64decode(data.oci_secrets_secretbundle.bundle.secret_bundle_content.0.content)
      host        = oci_core_instance.instance.public_ip
    }
  }
}

#######################################
## Sleep during Reboot
#######################################

resource "null_resource" "sleep_during_reboot" {
  depends_on = [null_resource.install_kvm_and_reboot]

  provisioner "local-exec" {
    command = "sleep 180" # 3mins
  }
}

#######################################
## Remote Exec 02
#######################################

resource "null_resource" "execute_shell_script" {
  depends_on = [null_resource.sleep_during_reboot]

  provisioner "remote-exec" {

    inline = [
      "cd /home/opc/scripts/",
      "sudo chown opc:opc /home/opc/scripts",
      "sudo chmod 777 /home/opc/scripts",
      "./gpu_slicing.sh ${var.gbs_for_vm}",
      "./network.sh ${var.gbs_for_vm} '${var.vlan_tag}' ${var.vnic_vlan_id} ${var.vlan_cidr_block}",
      "nohup ./enable_disable_services.sh >> enable_disable_services.out 2>&1 &",
      "./vm_creation_in_baremetal.sh",
      "nohup ./enable_start_vms_services.sh >> enable_start_vms_services.out 2>&1 &",
      "./execute_scripts_in_vm.sh ${data.oci_vault_secrets.secrets.secrets.*.id[0]} ${var.experience_id}",
    ]

    on_failure = continue


    connection {
      type        = "ssh"
      user        = "opc"
      private_key = base64decode(data.oci_secrets_secretbundle.bundle.secret_bundle_content.0.content)
      host        = oci_core_instance.instance.public_ip
    }


  }
}