// Copyright (c) 2021, 2022, Oracle and/or its affiliates.

################################
## Outputs Block - VLANs
## Create VLANs
################################

output "vlans_detail" {
  value = {
    "vlan_id"  = oci_core_vlan.vlan.id,
    "vlan_tag" = oci_core_vlan.vlan.vlan_tag
  }
}

