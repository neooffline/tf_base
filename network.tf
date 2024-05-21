resource "yandex_vpc_network" "nw1" {
  name = "${local.preffix}nw1"
}

resource "yandex_vpc_subnet" "sn1" {
  name = "${local.preffix}sn1"
  zone = "ru-central1-a"
  network_id = yandex_vpc_network.nw1.id
  v4_cidr_blocks = var.cidr_blocks[0]
  labels = var.labels
}

resource "yandex_vpc_subnet" "sn2" {
  name = "${local.preffix}sn2"
  zone = "ru-central1-b"
  network_id = yandex_vpc_network.nw1.id
  v4_cidr_blocks = var.cidr_blocks[1]
  labels = var.labels
}

resource "yandex_vpc_subnet" "sn3" {
  name = "${local.preffix}sn3"
  zone = "ru-central1-d"
  network_id = yandex_vpc_network.nw1.id
  v4_cidr_blocks = var.cidr_blocks[2]
  labels = var.labels
}

output "private_network1" {
  value = yandex_vpc_subnet.sn1.v4_cidr_blocks
}

output "private_network2" {
  value = yandex_vpc_subnet.sn2.v4_cidr_blocks
}

output "private_network3" {
  value = yandex_vpc_subnet.sn3.v4_cidr_blocks
}