terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_compute_network" "red_practica" {
  name                    = "red-practica-cloud"
  auto_create_subnetworks = true
}

resource "google_compute_firewall" "permitir_http_ssh" {
  name    = "permitir-http-ssh"
  network = google_compute_network.red_practica.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = ["servidor-web"]
}

resource "google_compute_instance" "vm_practica" {
  name         = "vm-practica-cloud"
  machine_type = var.machine_type
  zone         = var.zone

  tags = ["servidor-web"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 10
      type  = "pd-balanced"
    }
  }

  network_interface {
    network = google_compute_network.red_practica.name

    access_config {
    }
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y nginx
    systemctl enable nginx
    systemctl start nginx
  EOF
}

resource "google_storage_bucket" "bucket_practica" {
  name                        = var.bucket_name
  location                    = var.region
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
  force_destroy               = true

  versioning {
    enabled = true
  }
}