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
      name = "terraform-state-1lyu29om9hdbsy48k62y2n3hv0datl3dhf7q2p0dvlpd9"
      project = "devxp-339721"
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

