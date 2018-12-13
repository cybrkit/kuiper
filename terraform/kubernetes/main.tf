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

# The following outputs allow authentication and connectivity to the GKE Cluster.
output "endpoint" {
  value = "${google_container_cluster.primary.endpoint}"
}

output "client_key" {
  value = "${google_container_cluster.primary.master_auth.0.client_key}"
}

output "client_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.client_certificate}"
}

output "cluster_ca_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.cluster_ca_certificate}"
}