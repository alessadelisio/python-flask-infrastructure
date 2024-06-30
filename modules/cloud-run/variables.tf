variable "service_name" {
  description = "Nombre del servicio de Cloud Run"
  type        = string
}

variable "region" {
  description = "Región donde se desplegará el servicio de Cloud Run"
  type        = string
  default     = "us-central1"
}

variable "image" {
  description = "Imagen del contenedor"
  type        = string
}


