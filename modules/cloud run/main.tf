resource "google_cloud_run_service" "service" {
  name     = var.service_name
  location = var.region_name

  template {
    spec {
      containers {
        image = var.repository_name
        ports {
          name = "http1"
          container_port = 8080
        }
      }

    }

    metadata {
      annotations = {
        "run.googleapis.com/ingress"     = "all"
        "run.googleapis.com/http2"       = "true"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  autogenerate_revision_name = true
}

resource "google_project_iam_member" "run_invoker" {
  project = var.project_id
  role    = "roles/run.invoker"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}