resource "yandex_lb_target_group" "lb-tg-a" {
    name = "${local.preffix}target-group"
    labels = var.labels
    region_id = var.regions[0]
    target {
      subnet_id = yandex_vpc_subnet.sn1.id
      address = yandex_compute_instance.vm1.network_interface[0].ip_address
    }
}

resource "yandex_lb_target_group" "lb-tg-b" {
    name = "${local.preffix}target-group"
    labels = var.labels
    region_id = var.regions[1]
    target {
      subnet_id = yandex_vpc_subnet.sn2.id
      address = yandex_compute_instance.vm2.network_interface[0].ip_address
    }
}

resource "yandex_lb_target_group" "lb-tg-d" {
    name = "${local.preffix}target-group"
    labels = var.labels
    region_id = var.regions[2]
    target {
      subnet_id = yandex_vpc_subnet.sn3.id
      address = yandex_compute_instance.vm3.network_interface[0].ip_address
    }
}

resource "yandex_lb_network_load_balancer" "lb-nlb" {
    name = "${local.preffix}network-lb"
    labels = var.labels

    listener {
      name = "${local.preffix}listener"
      port = var.nlb_healthcheck.port
      external_address_spec {
        ip_version = "ipv4"
      }
    }

    attached_target_group {
      target_group_id = "${yandex_lb_target_group.lb-tg.id}"
      healthcheck {
        name = "${local.preffix}${var.nlb_healthcheck.name}"
        http_options {
          path = var.nlb_healthcheck.path
          port = var.nlb_healthcheck.port
        }
      }
    }
}