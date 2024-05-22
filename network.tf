resource "yandex_vpc_network" "this" {
  name = "${local.preffix}nw1"
}

resource "yandex_vpc_subnet" "this" {
  for_each = toset(var.zones)
  name = "${local.preffix}sn${each.value}"
  zone = each.value
  network_id = var.vpc_id != "" ? var.vpc_id : yandex_vpc_network.this.id
  v4_cidr_blocks = var.cidr_blocks[index(var.zones, each.value)]
  labels = var.labels
}