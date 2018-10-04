output "vcn_id" {
  value = "${oci_core_vcn.default_vcn.id}"
}

output "subnets" {
  value = "${data.oci_core_subnets.subnets.subnets}"
}