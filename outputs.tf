output "ssh_access" {
  value = "ssh -i ~/.ssh/hashicorp hashicorp@${google_compute_instance.vm.network_interface.0.access_config.0.nat_ip}"
  description = "SSH Access"
}

output "public_ip" {
  value = google_compute_instance.vm.network_interface.0.access_config.0.nat_ip
  description = "Virtual Machine Public IP address"
}

output "private_ip" {
  value = google_compute_instance.vm.network_interface.0.network_ip
  description = "Virtual Machine Private IP address"
}