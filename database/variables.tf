
# Required Variables
variable "tenancy_ocid" {}
variable "private_key_path" {}
variable "compartment_ocid" {}

variable "ssh_public_key" {}

variable "subnet_id" {}

variable "availability_domain" {}

# Optional Variables

variable "InstanceImageOCID" {
  type = "map"

  default = {
    // See https://docs.us-phoenix-1.oraclecloud.com/images/  // Oracle-provided image "Oracle-Linux"

    us-ashburn-1 = "ocid1.image.oc1.iad.aaaaaaaa2tq67tvbeavcmioghquci6p3pvqwbneq3vfy7fe7m7geiga4cnxa"
  }
}


variable "db_system_shape" {
    default = "VM.Standard2.4"
}

variable "db_data_storage_size_in_gb" {
  default = "512"
}

variable "db_version" {
  default = "18.2.0.0"
}



variable "db_edition" {
  default = "ENTERPRISE_EDITION"
}

variable "db_password" {
  default = "BEstrO0ng_#11"
}

variable "db_name" {
  default = "ORCL"
}

variable "db_pdb_name" {
  default = "PDB1"
}

variable "db_home_display_name" {
  default = "tfDatabase"
}

variable "db_system_display_name" {
  default = "dbSystem"
}

variable "db_hostname" {
  default = "db"
}

