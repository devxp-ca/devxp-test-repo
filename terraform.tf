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
      name = "terraform-state-gl94pyiuv2baspkde98upn2zcv0kg4fynfyap17r95c5p"
      project = "devxp-339721"
}

resource "google_cloud_run_service" "cloud-run-rlmq" {
      name = "cloud-run-rlmq"
      location = "us-west1"
      autogenerate_revision_name = true
      template {
        spec {
          containers {
            image = "gcr.io/devxp-339721/devxp:b79f5c8"
            env {
              name = "CONNECTION_STRING"
              value = var.CLOUD_RUN_CONNECTION_STRING
            }
            env {
              name = "GITHUB_CLIENT_ID"
              value = var.CLOUD_RUN_GITHUB_CLIENT_ID
            }
            env {
              name = "GITHUB_CLIENT_SECRET"
              value = var.CLOUD_RUN_GITHUB_CLIENT_SECRET
            }
          }
        }
      }
      traffic {
        percent = 100
        latest_revision = true
      }
      depends_on = [google_project_service.cloud-run-rlmq-service]
}

resource "google_cloud_run_service_iam_member" "cloud-run-rlmq-iam" {
      service = google_cloud_run_service.cloud-run-rlmq.name
      location = google_cloud_run_service.cloud-run-rlmq.location
      project = google_cloud_run_service.cloud-run-rlmq.project
      role = "roles/run.invoker"
      member = "allUsers"
}

resource "google_project_service" "cloud-run-rlmq-service" {
      disable_on_destroy = false
      service = "run.googleapis.com"
}


variable "CLOUD_RUN_CONNECTION_STRING" {
    type = string
    sensitive = true
}

variable "CLOUD_RUN_GITHUB_CLIENT_ID" {
    type = string
    sensitive = true
}

variable "CLOUD_RUN_GITHUB_CLIENT_SECRET" {
    type = string
    sensitive = true
}

output "cloud-run-rlmq-service-url" {
    value = google_cloud_run_service.cloud-run-rlmq.status[0].url
}

