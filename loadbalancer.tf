resource "yandex_lb_target_group" "lb-tg" {
    name = "${local.preffix}target-group"
    labels = var.labels
    region_id = "ru-central1"
    target {
      subnet_id = yandex_vpc_subnet.this[0].id
      address = yandex_compute_instance.this[0].network_interface[0].ip_address
    }
    target {
      subnet_id = yandex_vpc_subnet.this[1].id
      address = yandex_compute_instance.this[1].network_interface[0].ip_address
    }
    target {
      subnet_id = yandex_vpc_subnet.this[2].id
      address = yandex_compute_instance.this[2].network_interface[0].ip_address
    }
}

resource "yandex_lb_network_load_balancer" "lb-nlb" {
    name = "${local.preffix}nlb"
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