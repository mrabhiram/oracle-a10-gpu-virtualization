// Copyright (c) 2021, 2022, Oracle and/or its affiliates.

############################
# Provider Block 
# OCI
############################

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
    region           = var.region
}

terraform {
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = ">= 4.0.0"
    }
  }
}

/*
# Uncomment and update to use Object Storage Bucket as the backend
# !!! WARNING !!! Terraform State Lock is not supported with OCI Object Storage.
# Pre-Requisite: Create a version enabled object storage bucket to store the state file.
# End Point Format: https://<namespace>.compat.objectstorage.<region>.oraclecloud.com
# Please look at the below doc for information about shared_credentials_file and other parameters:
# Reference: https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/terraformUsingObjectStore.htm

terraform {
  backend "s3" {
    bucket   = "genxp_backend"
    key      = join("-",[var.statefile_prefix],[".tfstate"])
    region   = "us-ashburn-1"
    endpoint = "https://orasenatdoracledigital01.compat.objectstorage.us-ashburn-1.oraclecloud.com"
    #shared_credentials_file     = "~/.aws/credentials"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}
*/