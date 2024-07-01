resource "google_cloud_run_service" "service" {
  name     = var.service_name
  location = var.region_name
  project  = var.project_id

  metadata {
    annotations = {
      "run.googleapis.com/client-protocol" = "HTTP2"
    }
  }

  template {
    metadata {
      annotations = {
        "run.googleapis.com/client-protocol" = "HTTP2"
      }
    }
    spec {
      containers {
        image = var.image
        ports {
          name = "http1"
          container_port = 8080
          protocol = "TCP"
        }
      }
    }
  }

  traffic {
    latest_revision = true
    percent         = 100
  }
}
