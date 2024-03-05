output "ssh_access" {
  value = "ssh debian@${google_compute_instance.vm.network_interface.0.network_ip}"
  description = "SSH Access"
}

output "public_ip" {
  value = google_compute_instance.vm.network_interface.0.network_ip
  description = "Virtual Machine Public IP address"
}

output "private_ip" {
  value = google_compute_instance.vm.network_interface.0.network_ip
  description = "Virtual Machine Private IP address"
}