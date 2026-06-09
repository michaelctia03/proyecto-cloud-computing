variable "project_id" {
  description = "ID del proyecto de Google Cloud"
  type        = string
  default     = "level-approach-498401-m9"
}

variable "region" {
  description = "Región de Google Cloud"
  type        = string
  default     = "southamerica-east1"
}

variable "zone" {
  description = "Zona de Google Cloud"
  type        = string
  default     = "southamerica-east1-a"
}

variable "machine_type" {
  description = "Tipo de máquina virtual"
  type        = string
  default     = "e2-micro"
}

variable "bucket_name" {
  description = "Nombre único del bucket de almacenamiento"
  type        = string
  default     = "michael-proyecto-cloud-storage"
}