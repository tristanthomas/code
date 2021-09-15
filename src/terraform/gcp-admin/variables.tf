variable "firebase_location_id" {
  type        = string
  description = "Default resource location of Firebase project"
  default     = "us-central"
}
variable "gcp_admin_project_id" {
  type        = string
  description = "Admin project for Terraform service account"
}

variable "org_id" {
  type        = string
  description = "GCP Organization ID"
}
variable "random_id_prefix" {
  type        = string
  description = "Random ID prefix"
}

variable "region" {
  type        = string
  description = "GCP region"
  default     = "us-central1"
}
variable "zone" {
  type        = string
  description = "GCP zone"
  default     = "us-central1-c"
}