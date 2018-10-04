# Required Variables
variable "tenancy_ocid" {}

variable "compartment_ocid" {}

variable "vcn_id" {}

variable "region" {}

variable "ssh_public_key" {}

# Optional Variables

variable "instance_count" {
  default = "1"
}

variable "instance_name" {
  default = "tfInstance"
}

variable "instance_hostname" {
  default = "tfinstance"
}

variable "instance_shape" {
  default = "VM.Standard1.2"
}

variable "instance_image_OCID" {
  type = "map"

  default = {
    // See https://docs.us-phoenix-1.oraclecloud.com/images/  // Oracle-provided image "Canonical-Ubuntu-16.04-2018.06.18-0"

    us-ashburn-1 = "ocid1.image.oc1.iad.aaaaaaaamdw6vims4gjsayfnjr23tpgixkylc7sjedlzwfznxmny6enpgvfq"
  }
}
