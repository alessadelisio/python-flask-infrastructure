module "cloud-storage" {
  source = "./modules/cloud-storage"

  bucket_name = var.bucket_name
  project_id  = var.project_id
  region_name = var.region_name
}

module "iam" {
  source = "./modules/iam"

  project_id         = var.project_id
  service_account_id = var.service_account_id
}
