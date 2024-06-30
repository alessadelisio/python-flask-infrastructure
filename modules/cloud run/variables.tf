variable "region_name" {
    type = string
    description = "default is us-central1"
    default = "us-central1"
}

variable "cloud_run_app" {
  type = string
}
variable "repository_name" {
  type = string
}