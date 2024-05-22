# output "ip_address_vm1" {
#     value = yandex_compute_instance.this[0].network_interface[0].ip_address
# }

# output "ip_address_vm2" {
#   value = yandex_compute_instance.this[1].network_interface[0].ip_address
# }

# output "ip_address_vm3" {
#   value = yandex_compute_instance.this[2].network_interface[0].ip_address
# }

# output "nat_ip_address_vm1" {
#   value = yandex_compute_instance.this[0].network_interface[0].nat_ip_address
# }

# output "nat_ip_address_vm2" {
#   value = yandex_compute_instance.this[1].network_interface[0].nat_ip_address
# }

# output "nat_ip_address_vm3" {
#   value = yandex_compute_instance.this[1].network_interface[0].nat_ip_address
# }

# output "lb_external_ip" {
#   value = yandex_lb_target_group.lb-tg.target
# }

output "priv_key" {
  value = var.public_key_path != "" ? "" : tls_private_key.vm_pk[0].private_key_openssh
  sensitive = true
}

output "pub_key" {
  value = var.public_key_path != "" ? "" : tls_private_key.vm_pk[0].public_key_openssh
}