output "vm_internal_ip_address" {
  value = [
    for ip_address in yandex_compute_instance.this[*].network_interface[0].ip_address: ip_address
    ]
}


output "vm_nat_ip_address" {
  value = [
    for nat_ip_address in yandex_compute_instance.this[*].network_interface[0].nat_ip_address: nat_ip_address
    ]
}


output "lb_external_ip" {
  value = yandex_lb_target_group.this.target
}

output "priv_key" {
  value = var.public_key_path != "" ? "" : tls_private_key.vm_pk[0].private_key_openssh
  sensitive = true
}

output "pub_key" {
  value = var.public_key_path != "" ? "" : tls_private_key.vm_pk[0].public_key_openssh
}