output "instance_ip" {
  value = ["${oci_core_instance.instance.*.public_ip}"]
}

output "instance_id" {
  value = ["${oci_core_instance.instance.*.id}"]
}




