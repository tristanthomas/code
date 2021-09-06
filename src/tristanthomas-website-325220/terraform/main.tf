terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "tristanthomas"

    workspaces {
      name = "tristanthomas-website-325220"
    }
  }
}

provider "google" {
  region = var.region
  zone   = var.zone
}
