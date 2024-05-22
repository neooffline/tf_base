resource "yandex_vpc_network" "this" {
  name = "${local.preffix}nw1"
}

resource "yandex_vpc_subnet" "this" {
  count = 3
  name = "${local.preffix}sn${count.index + 1}"
  zone = var.zones[count.index]
  network_id = yandex_vpc_network.this.id
  v4_cidr_blocks = var.cidr_blocks[count.index]
  labels = var.labels
}