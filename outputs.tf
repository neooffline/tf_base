output "private_network1" {
  value = yandex_vpc_subnet.sn1.v4_cidr_blocks
}

output "private_network2" {
  value = yandex_vpc_subnet.sn2.v4_cidr_blocks
}

output "private_network3" {
  value = yandex_vpc_subnet.sn3.v4_cidr_blocks
}

output "ip_address_vm1" {
  value = yandex_compute_instance.vm1.network_interface[0].ip_address
}

output "ip_address_vm2" {
  value = yandex_compute_instance.vm2.network_interface[0].ip_address
}

output "ip_address_vm3" {
  value = yandex_compute_instance.vm3.network_interface[0].ip_address
}

output "nat_ip_address_vm1" {
  value = yandex_compute_instance.vm1.network_interface[0].nat_ip_address
}

output "nat_ip_address_vm2" {
  value = yandex_compute_instance.vm2.network_interface[0].nat_ip_address
}

output "nat_ip_address_vm3" {
  value = yandex_compute_instance.vm3.network_interface[0].nat_ip_address
}

output "lb_external_ip" {
  value = yandex_lb_target_group.lb-tg.target
}

output "priv_key" {
  value = var.public_key_path != "" ? "" : tls_private_key.vm_pk.private_key_openssh
  sensitive = true
}

output "pub_key" {
  value = var.public_key_path != "" ? "" : tls_private_key.vm_pk.public_key_openssh
}