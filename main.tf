module "apis" {
  source = "./modules/apis"

  project_id = var.project_id
}

module "cloud-storage" {
  source = "./modules/cloud-storage"

  depends_on  = [module.apis]
  bucket_name = var.bucket_name
  project_id  = var.project_id
  region_name = var.region_name
}

module "iam" {
  source = "./modules/iam"

  depends_on         = [module.apis]
  project_id         = var.project_id
  service_account_id = var.service_account_id
}
