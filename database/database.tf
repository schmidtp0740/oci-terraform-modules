resource "oci_database_db_system" "standard_db" {
    availability_domain = "${var.availability_domain}"
    compartment_id = "${var.compartment_ocid}"
    cpu_core_count = "${lookup(data.oci_database_db_system_shapes.db_shapes.db_system_shapes[0], "minimum_core_count")}"
    # data_storage_percentage = "${var.data_storage_percentage}"
    data_storage_size_in_gb = "${var.db_data_storage_size_in_gb}"
    database_edition = "${var.db_edition}"
    db_home {
        database {
            admin_password = "${var.db_password}"
            # backup_id = "${}"
            # backup_tde_password = ""
            # character_set = "${var.character_set}"

            # db_backup_config {
            #     auto_backup_enabled = true    
            # }
            db_name = "${var.db_name}"
            # db_workload = "${var.db_workload}"
            # ncharacter_set = "${var.n_character_set}"
            pdb_name = "${var.db_pdb_name}"

        }
        db_version = "${var.db_version}"
        display_name = "${var.db_home_display_name}"
    }
    # disk_redundancy = "${var.db_disk_redundancy}"
    display_name = "${var.db_system_display_name}"
    # domain = 
    hostname = "${var.db_hostname}"
    # license_model = "${var.license_model}"
    node_count = "${lookup(data.oci_database_db_system_shapes.db_shapes.db_system_shapes[0], "minimum_node_count")}"
    shape = "${var.db_system_shape}"
    # source = ""
    ssh_public_keys = ["${var.ssh_public_key}"]
    subnet_id = "${var.subnet_id}"

    # defined_tags = 
    # freeform_tags = 
}