variable "service_name" {
  type        = string
  description = "Name of the Cloud Run service"
}

variable "project_id" {
  type        = string
  description = "Google Cloud Platform Project ID"
}

variable "region_name" {
  type        = string
  description = "default is us-central1"
  default     = "us-central1"
}

variable "image" {
  type        = string
  description = "Container image to deploy"
}

variable "container_concurrency" {
  type        = number
  description = "The maximum number of requests that each container instance can handle"
  default     = 80
}

variable "invoker_identity" {
  type        = string
  description = "Identity that will invoke the Cloud Run service"
}
