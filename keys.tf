resource "tls_private_key" "vm_pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

