data "oci_core_subnets" "subnets" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${var.vcn_id}"
}