resource "google_artifact_registry_repository" "my-repo" {
  location      = var.region_name
  repository_id = var.repository_name
  description   = "python-flask-website repository"
  format        = "DOCKER"
}