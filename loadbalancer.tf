resource "yandex_lb_target_group" "this" {    
    name = "${local.preffix}target-group"
    labels = var.labels
    region_id = "ru-central1"
    dynamic "target" {
      for_each = yandex_compute_instance.this
      content {
        subnet_id = target.value.network_interface[0].subnet_id
        address = target.value.network_interface[0].ip_address  
      }
      
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
      target_group_id = "${yandex_lb_target_group.this.id}"
      healthcheck {
        name = "${local.preffix}${var.nlb_healthcheck.name}"
        http_options {
          path = var.nlb_healthcheck.path
          port = var.nlb_healthcheck.port
        }
      }
    }
}