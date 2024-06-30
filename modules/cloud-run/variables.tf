# modules/cloud-run/variables.tf
variable "service_name" {
  type        = string
  description = "The name of the Cloud Run service"
}

variable "project_id" {
  type        = string
  description = "Google Cloud Platform Project ID"
}

variable "region_name" {
  type        = string
  description = "The region where the service will be deployed"
}

variable "image" {
  type        = string
  description = "The container image to deploy"
}
