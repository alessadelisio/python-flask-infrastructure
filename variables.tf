variable "bucket_name" {
  type        = string
  description = "Bucket Name"
}

variable "bucket_temporary" {
  type        = string
  description = "Bucket Name"
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

variable "repository_name" {
  type        = string
  description = "Artifact Registry name"
}

variable "service_account_id" {
  type        = string
  description = "Name of the IAM Service Account"
}
