terraform {
 backend "gcs" {
   bucket  = "python-flask-infrastructure"
   prefix  = "state"
 }
}
