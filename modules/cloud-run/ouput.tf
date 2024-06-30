output "url" {
  description = "URL del servicio de Cloud Run"
  value       = google_cloud_run_service.default.status[0].url
}
