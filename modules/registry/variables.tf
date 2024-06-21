variable "region_name" {
  type        = string
  description = "default is us-central1"
  default     = "us-central1"
}

variable "repository_name" {
  type        = string
  description = "Artifact Registry name"
}
