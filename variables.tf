variable "project_id" {
  type = string
  description = "GCP project"
  default     = "openenv-xtqnw"
}

variable "region" {
  type = string
  description = "GCP region"
  default     = "europe-west1"
}

variable "ssh_key" {
  type = string
  description = "SSH key"
}

variable "instance_type" {
  type = string
  description = "GCP instance type"
  default     = "n2-standard-2"
}

variable "instance_name" {
  type = string
  description = "GCP instance name"
  default     = "terraform"
}