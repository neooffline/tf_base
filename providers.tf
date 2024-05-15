terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "~> 0.80"
    }
    random = {
        source = "hashicorp/random"
    }
    tls = {
        source = "hashicorp/tls"
    }
  }
  required_version = ">= 0.13"
}