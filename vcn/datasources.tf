data "oci_identity_availability_domains" "ADs" {
  compartment_id = "${var.tenancy_ocid}"
}

data "oci_core_subnets" "subnets" {
  compartment_id = "${var.tenancy_ocid}"
  vcn_id = "${oci_core_vcn.default_vcn.id}"
}