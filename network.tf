resource "yandex_vpc_network" "nw1" {
  name = "${local.preffix}nw1"
}

resource "yandex_vpc_subnet" "sn1" {
  name = "${local.preffix}sn1"
  zone = var.regions[0]
  network_id = yandex_vpc_network.nw1.id
  v4_cidr_blocks = var.cidr_blocks[0]
  labels = var.labels
}

resource "yandex_vpc_subnet" "sn2" {
  name = "${local.preffix}sn2"
  zone = var.regions[1]
  network_id = yandex_vpc_network.nw1.id
  v4_cidr_blocks = var.cidr_blocks[1]
  labels = var.labels
}

resource "yandex_vpc_subnet" "sn3" {
  name = "${local.preffix}sn3"
  zone = var.regions[2]
  network_id = yandex_vpc_network.nw1.id
  v4_cidr_blocks = var.cidr_blocks[2]
  labels = var.labels
}