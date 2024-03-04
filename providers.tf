terraform {
  required_version = "~> 1.2"
  
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 3.64.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region = var.region
}