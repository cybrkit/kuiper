resource "google_container_cluster" "primary" {
  zone = "${var.region}-a"
  name = "${var.kubernetes_cluster_name}"
  initial_node_count = "${var.kubernetes_node_count}"

  master_auth {
    username = "${var.kubernetes_username}"
    password = "${var.kubernetes_password}"
  }

  node_config {
    machine_type = "${var.kubernetes_machine_type}"
    disk_size_gb = "${var.kubernetes_disk_size}"
  }
}