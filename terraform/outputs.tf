output "nombre_vm" {
  description = "Nombre de la máquina virtual creada"
  value       = google_compute_instance.vm_practica.name
}

output "ip_externa_vm" {
  description = "Dirección IP externa de la máquina virtual"
  value       = google_compute_instance.vm_practica.network_interface[0].access_config[0].nat_ip
}

output "url_servidor_web" {
  description = "URL para acceder al servidor Nginx"
  value       = "http://${google_compute_instance.vm_practica.network_interface[0].access_config[0].nat_ip}"
}

output "nombre_bucket" {
  description = "Nombre del bucket creado"
  value       = google_storage_bucket.bucket_practica.name
}

output "region_bucket" {
  description = "Región del bucket"
  value       = google_storage_bucket.bucket_practica.location
}