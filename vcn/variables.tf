# Required Variables
variable "tenancy_ocid" {}

variable "compartment_ocid" {}



# Optional Variables

variable "vcn_name" {
  default = "tfVCN"
}

variable "vcn_cidr_block" {
  default = "10.0.0.0/16"
}

# automatically creates a subnet for each cidr block
variable "subnet_cidr_blocks" {
  type = "list"
  default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}