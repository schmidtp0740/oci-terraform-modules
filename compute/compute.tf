resource "oci_core_instance" "instance" {
  availability_domain = "${lookup(data.oci_core_subnets.subnets.subnets[count.index % length(data.oci_core_subnets.subnets.subnets)], "availability_domain")}"
  compartment_id      = "${var.compartment_ocid}"
  count               = "${var.instance_count}"
  display_name        = "${var.instance_name}${count.index}"
  shape               = "${var.instance_shape}"
  count = "${var.count}"

  create_vnic_details {
    subnet_id        = "${lookup(data.oci_core_subnets.subnets.subnets[count.index % length(data.oci_core_subnets.subnets.subnets)], "id")}"
    display_name     = "primaryvnic"
    assign_public_ip = true
    hostname_label   = "${var.instance_hostname}${count.index}"
  }

  source_details {
    source_type = "image"
    source_id   = "${var.instance_image_OCID[var.region]}"
  }

  metadata {
    ssh_authorized_keys = "${var.ssh_public_key}"
  }

  timeouts {
    create = "60m"
  }
}
