resource "google_cloud_run_v2_service" "default" {
  name     = var.cloud_run_app
  location = var.region_name

  template {
    spec {
      containers {
        image = var.repository_name
        ports {
          name           = "http1"
          container_port = 8080
        }
      }
    }
    metadata {
      annotations = {
        "run.googleapis.com/ingress" = "all"
        "run.googleapis.com/http2"   = "true"
      }
    }
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role    = "roles/run.invoker"
    members = ["allUsers"]
  }
}

resource "google_cloud_run_service_iam_member" "noauth" {
  location = google_cloud_run_v2_service.default.location
  project  = google_cloud_run_v2_service.default.project
  service  = google_cloud_run_v2_service.default.name

  role   = "roles/run.invoker"
  member = "allUsers"
}
