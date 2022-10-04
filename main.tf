terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.37.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "terraform-gcp-363115"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "mykey.json"
}

resource "google_service_account" "sa" {
  account_id   = "my-service-account"
  display_name = "A service account that Jane can use"
}

resource "google_service_account_iam_member" "admin-account-iam" {
  service_account_id = google_service_account.sa.name
  role               = "roles/iam.serviceAccountUser"
  member             = "user:jane@example.com"
}

resource "google_service_account_iam_member" "admin-account-iam1" {
  service_account_id = google_service_account.sa.name
  role               = "roles/iam.serviceAccountAdmin"
  member             = "user:jane@example.com"
}
