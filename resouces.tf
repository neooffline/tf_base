data "yandex_compute_image" "this" {
  family = var.image_family
}

resource "yandex_compute_instance" "this" {
  count = var.vm_count
  name = "${local.preffix}vm${count.index + 1}"
  platform_id = var.zones[count.index % length(var.zones)] != "ru-central1-d" ? "standard-v1" : "standard-v2"
  zone = var.zones[count.index % length(var.zones)]

  allow_stopping_for_update = true

  resources {
    cores = var.resources.cpu
    memory = var.resources.memory
  }
  
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.this.id
      size = var.resources.disk
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.this[var.zones[count.index % length(var.zones)]].id
    nat = true
  }

  metadata = {
    ssh-keys = var.public_key_path != "" ? "${split(var.image_family,"-")[0]}:${file(var.public_key_path)}" : "${split(var.image_family,"-")[0]}:${tls_private_key.vm_pk[0].public_key_openssh}"
  }
}