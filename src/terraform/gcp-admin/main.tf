terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "tristanthomas"

    workspaces {
      name = "gcp-admin"
    }
  }
}

provider "google-beta" {
  region = var.region
  zone   = var.zone
}

resource "random_id" "id" {
  byte_length = 4
  prefix      = var.random_id_prefix
}

resource "google_project_service" "cloudresourcemanager" {
  project = var.gcp_admin_project_id
  service = "cloudresourcemanager.googleapis.com"
}

resource "google_project_service" "iam" {
  project = var.gcp_admin_project_id
  service = "iam.googleapis.com"
}

resource "google_project_service" "firebase" {
  project = var.gcp_admin_project_id
  service = "firebase.googleapis.com"
}

resource "google_project" "gcp-admin" {
  provider   = google-beta
  project_id = random_id.id.hex
  name       = random_id.id.hex
  org_id     = var.org_id

  depends_on = [
    google_project_service.cloudresourcemanager,
  ]
}

resource "google_firebase_project" "hosting" {
  provider = google-beta
  project  = google_project.gcp-admin.project_id

  depends_on = [
    google_project_service.firebase,
  ]
}

resource "google_firebase_project_location" "hosting" {
  provider    = google-beta
  project     = google_firebase_project.hosting.project
  location_id = var.firebase_location_id
}
