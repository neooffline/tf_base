resource "yandex_compute_instance" "vm1" {
  name = "${local.preffix}vm${var.vm_number_1}"
  platform_id = "standard-v1"
  zone = var.zones[0]

  allow_stopping_for_update = true

  resources {
    cores = var.resources.cpu
    memory = var.resources.memory
  }
  
  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = var.resources.disk
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.sn1.id
    nat = true
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/slurm_edu.pub")}"
  }
}

resource "yandex_compute_instance" "vm2" {
  name = "${local.preffix}vm${var.vm_number_2}"
  platform_id = "standard-v1"
  zone = var.zones[1]
  
  resources {
    cores = var.resources.cpu
    memory = var.resources.memory
  }
  
  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = var.resources.disk
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.sn2.id
    nat = true
  }
  metadata = {
    ssh-keys = "centos:${file("~/.ssh/slurm_edu.pub")}"
  }
}

resource "yandex_compute_instance" "vm3" {
  name = "${local.preffix}vm${var.vm_number_3}"
  platform_id = "standard-v2"
  zone = var.zones[2]
  
  resources {
    cores = var.resources.cpu
    memory = var.resources.memory
  }
  
  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = var.resources.disk
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.sn3.id
    nat = true
  }
  metadata = {
    ssh-keys = "centos:${file("~/.ssh/slurm_edu.pub")}"
  }
}