provider "google" {
  credentials = "${file("account.json")}"
  project = "${var.project_id}"
  region = "${var.region}"
}

module "kubernetes" {
  source = "kubernetes"
  region = "${var.region}"
  kubernetes_cluster_name = "${var.kubernetes_cluster_name}"

  kubernetes_machine_type = "${var.kubernetes_machine_type}"
  kubernetes_disk_size = "${var.kubernetes_disk_size}"
  kubernetes_node_count = "${var.kubernetes_node_count}"

  kubernetes_username = "${var.kubernetes_username}"
  kubernetes_password = "${var.kubernetes_password}"
}