resource "google_compute_network" "vpc" {
  name                    = "${var.instance_name}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.instance_name}-subnet"
  ip_cidr_range = "10.128.10.0/24"
  region        = var.region
  network       = google_compute_network.vpc.name
}

resource "google_compute_instance" "vm" {
  name                      = var.instance_name
  machine_type              = var.instance_type
  zone                      = "${var.region}-b"

  tags                      = ["${var.instance_name}"]
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  #metadata = {
  #  ssh-keys = "${var.ssh_user}:${file(var.pubkey_file)}"
  #}

  network_interface {
    network    = google_compute_network.vpc.name
    subnetwork = google_compute_subnetwork.subnet.name
    access_config {
    }
  }
}

resource "google_compute_firewall" "rules" {
  name        = "${var.instance_name}-fwr"
  network     = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["${var.instance_name}"]
}