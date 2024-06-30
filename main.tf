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


module "cloud-run" {
  source              = "./modules/cloud-run"
  depends_on      = [module.apis]

  service_name        = "production-service"
  project_id          = var.project_id
  region_name         = var.region_name
  repository_name               = var.repository_name
  invoker_identity    = "serviceAccount:${google_service_account.service_account.email}"
}