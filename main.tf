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

module "registry" {
  source = "./modules/registry"

  depends_on      = [module.apis]
  repository_name = var.repository_name
  region_name     = var.region_name
}

module "production_application" {
  source       = "./modules/cloud-run"
  service_name = "production-application-alessadelisio"
  project_id   = var.project_id
  region_name  = var.region_name
  image        = "gcr.io/${var.project_id}/production-application-alessadelisio"
}

module "staging_application" {
  source       = "./modules/cloud-run"
  service_name = "staging-application-alessadelisio"
  project_id   = var.project_id
  region_name  = var.region_name
  image        = "gcr.io/${var.project_id}/staging-application-alessadelisio"
}
