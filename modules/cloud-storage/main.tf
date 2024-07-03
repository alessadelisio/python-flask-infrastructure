resource "google_storage_bucket" "terraform_state" {
  location      = var.region_name
  name          = var.bucket_name
  project       = var.project_id
  storage_class = "STANDARD"


  versioning {
    enabled = true
  }
}

resource "google_storage_bucket" "temporary_bucket" {
  location      = var.region_name
  name          = var.bucket_temporary
  project       = var.project_id
  storage_class = "STANDARD"


  versioning {
    enabled = true
  }
}
