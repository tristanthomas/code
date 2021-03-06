terraform {
  required_providers {
    google = {
      source  = "hashicorp/google-beta"
      version = "~> 3.82.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
  }

  required_version = "~> 1.0.6"
}
