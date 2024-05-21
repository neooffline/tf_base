resource "yandex_compute_instance" "vm1" {
  name = "${local.preffix}vm${var.vm_number_1}"
  platform_id = "standard-v1"
  zone = "ru-central1-a"

  allow_stopping_for_update = true

  resources {
    cores = 2
    memory = 4
  }
  
  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.sn1.id
  }
}

resource "yandex_compute_instance" "vm2" {
  name = "${local.preffix}vm${var.vm_number_2}"
  platform_id = "standard-v1"
  zone = "ru-central1-b"
  
  resources {
    cores = 2
    memory = 2
  }
  
  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.sn2.id
  }
}

resource "yandex_compute_instance" "vm3" {
  name = "${local.preffix}vm${var.vm_number_3}"
  platform_id = "standard-v2"
  zone = "ru-central1-d"
  
  resources {
    cores = 2
    memory = 2
  }
  
  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.sn3.id
  }
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