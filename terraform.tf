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
      name = "terraform-state-5tkjwht6v82xph43tmmwxqgpj7drcw8aucs13c3lpwej4"
      project = "devxp-339721"
}

resource "google_cloud_run_service" "cloud-run-gbbt" {
      name = "cloud-run-gbbt"
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
      depends_on = [google_project_service.cloud-run-gbbt-service]
}

resource "google_cloud_run_service_iam_member" "cloud-run-gbbt-iam" {
      service = google_cloud_run_service.cloud-run-gbbt.name
      location = google_cloud_run_service.cloud-run-gbbt.location
      project = google_cloud_run_service.cloud-run-gbbt.project
      role = "roles/run.invoker"
      member = "allUsers"
}

resource "google_project_service" "cloud-run-gbbt-service" {
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

output "cloud-run-gbbt-service-url" {
    value = google_cloud_run_service.cloud-run-gbbt.status[0].url
}

