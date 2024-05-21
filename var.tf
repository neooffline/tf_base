variable "image_id" {
  type = string
  description = "Variable to set image name"
}

variable "vm_number_1" {
  type = number
  description = "Index of vm1"
}

variable "vm_number_2" {
  type = number
  description = "Index of vm2"
}

variable "vm_number_3" {
  type = number
  description = "Index of vm3"
}

variable "labels" {
  type = map(string)
  description = "Default labels for resources"
}

variable "resources" {
  type = object({
    cpu =  number
    disk = number
    memory = number
  })
  description = "Resources props"
}

variable "cidr_blocks" {
  type = list(list(string))
  description = "Subnet cidr blocks"
}

variable "regions" {
  type = list(string)
}

variable "nlb_healthcheck" {
  type = object({
    name = string
    port = number
    port = string
  })
}

locals {
  preffix = "slurm-"
  nlb_healthcheck = {
    name   = "test"
    port   = 80
    path   = "/"
}
}
