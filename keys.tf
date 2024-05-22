resource "tls_private_key" "vm_pk" {
  count = var.public_key_path != "" ? 0 : 1
  algorithm = "RSA"
  rsa_bits  = 4096
}

