data "oci_identity_availability_domains" "availability_domains" {
  compartment_id = "${var.tenancy_ocid}"
}

data "oci_database_db_system_shapes" "db_shapes" {
	availability_domain = "${lookup(data.oci_identity_availability_domains.availability_domains.availability_domains[0],"name")}"
	compartment_id = "${var.compartment_ocid}"
    filter {
        name = "shape"
        values = ["${var.db_system_shape}"]
    }
}