terraform {
  required_providers {
    google =  {
    source = "hashicorp/google"
    version = ">= 4.10.0"
    }
  }
}

provider "google" {
    project = "devxp-339721"
    region = "us-west1"
}

resource "google_storage_bucket" "terraform_backend_bucket" {
      location = "us-west1"
      name = "terraform-state-04si3f0ysrwu5i3tho3jm7mskrlge5qwne2iirzw1g5bo"
      project = "devxp-339721"
}

resource "google_compute_instance" "gce-kglh" {
      name = "gce-kglh"
      machine_type = "f1-micro"
      zone = "us-west1-a"
      network_interface {
        network = "default"
      }
      boot_disk {
        initialize_params {
          image = "ubuntu-2004-focal-v20220204"
        }
      }
      project = "devxp-339721"
}

resource "google_project_service" "gce-kglh-service" {
      disable_on_destroy = false
      service = "compute.googleapis.com"
}

resource "google_cloud_run_service" "cloud-run-krxs" {
      name = "cloud-run-krxs"
      location = "us-west1"
      autogenerate_revision_name = true
      template {
        spec {
          containers {
            image = "gcr.io/devxp-339721/devxp:b79f5c8"
            env {
              name = "CONNECTION_STRING"
              value = var.CONNECTION_STRING
            }
            env {
              name = "GITHUB_CLIENT_ID"
              value = var.GITHUB_CLIENT_ID
            }
            env {
              name = "GITHUB_CLIENT_SECRET"
              value = var.GITHUB_CLIENT_SECRET
            }
          }
        }
      }
      traffic {
        percent = 100
        latest_revision = true
      }
      depends_on = [google_project_service.cloud-run-krxs-service]
}

resource "google_cloud_run_service_iam_member" "cloud-run-krxs-iam" {
      service = google_cloud_run_service.cloud-run-krxs.name
      location = google_cloud_run_service.cloud-run-krxs.location
      project = google_cloud_run_service.cloud-run-krxs.project
      role = "roles/run.invoker"
      member = "allUsers"
}

resource "google_project_service" "cloud-run-krxs-service" {
      disable_on_destroy = false
      service = "run.googleapis.com"
}

resource "google_storage_bucket" "storage-bucket-yldp-asjx-cubl-xkxa-ebzn" {
      name = "storage-bucket-yldp-asjx-cubl-xkxa-ebzn"
      location = "us-west1"
      project = "devxp-339721"
}


variable "CONNECTION_STRING" {
    type = string
    sensitive = true
}

variable "GITHUB_CLIENT_ID" {
    type = string
    sensitive = true
}

variable "GITHUB_CLIENT_SECRET" {
    type = string
    sensitive = true
}

output "cloud-run-krxs-service-url" {
    value = google_cloud_run_service.cloud-run-krxs.status[0].url
}

