resource "oci_core_vcn" "default_vcn" {
  #Required
  cidr_block = "${var.vcn_cidr_block}"

  compartment_id = "${var.compartment_ocid}"
  dns_label      = "vcn"
  display_name   = "${var.vcn_name}"
}

resource "oci_core_internet_gateway" "gateway" {
  compartment_id = "${var.compartment_ocid}"
  display_name   = "gateway"
  vcn_id         = "${oci_core_vcn.default_vcn.id}"
}

resource "oci_core_route_table" "default_tf_route_table" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_vcn.default_vcn.id}"
  display_name   = "Default Route Table"

  route_rules {
    destination        = "0.0.0.0/0"
    network_entity_id = "${oci_core_internet_gateway.gateway.id}"
  }

}

resource "oci_core_security_list" "default_tf_security_list" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_vcn.default_vcn.id}"
  display_name   = "Default Security List"

  // allow outbound tcp traffic on all ports
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

  // allow inbound ssh traffic from a specific port
  ingress_security_rules {
    protocol  = "6"         // tcp
    source    = "0.0.0.0/0"
    stateless = true

    tcp_options {
      // these represent destination port range
      "min" = 22
      "max" = 22
    }
  }

  // allow inbound icmp traffic of a specific type
  ingress_security_rules {
    protocol  = "1"         // icmp
    source    = "0.0.0.0/0"
    stateless = true
  }
}

resource "oci_core_subnet" "subnet" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[count.index % 3], "name")}"
  count               = "${length(var.subnet_cidr_blocks)}"
  cidr_block          = "${element(var.subnet_cidr_blocks, count.index)}"
  display_name        = "Subnet-${count.index}"
  dns_label           = "subnet${count.index}"
  compartment_id      = "${var.compartment_ocid}"
  vcn_id              = "${oci_core_vcn.default_vcn.id}"
  security_list_ids   = ["${oci_core_security_list.default_tf_security_list.id}"]
  compartment_id      = "${var.compartment_ocid}"
  route_table_id      = "${oci_core_route_table.default_tf_route_table.id}"
  dhcp_options_id     = "${oci_core_vcn.default_vcn.default_dhcp_options_id}"
}


