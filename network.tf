resource "yandex_vpc_network" "nw1" {
  name = "nw1"
}

resource "yandex_vpc_subnet" "sn1" {
  name = "sn1"
  zone = "ru-central1-a"
  network_id = yandex_vpc_network.nw1.id
  v4_cidr_blocks = [ "10.32.1.0/24" ]
}

resource "yandex_vpc_subnet" "sn2" {
  name = "sn2"
  zone = "ru-central1-b"
  network_id = yandex_vpc_network.nw1.id
  v4_cidr_blocks = [ "10.32.11.0/24" ]
}

resource "yandex_vpc_subnet" "sn3" {
  name = "sn3"
  zone = "ru-central1-d"
  network_id = yandex_vpc_network.nw1.id
  v4_cidr_blocks = [ "10.32.111.0/24" ]
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