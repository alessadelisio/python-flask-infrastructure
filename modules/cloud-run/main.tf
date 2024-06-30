resource "google_cloud_run_service" "default" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      containers {
        image = var.image
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
