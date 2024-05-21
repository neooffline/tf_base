image_id = "fd82tb3u07rkdkfte3dn"
vm_number_1 = 1
vm_number_2 = 2
vm_number_3 = 3

resources = {
  cpu = 2
  memory = 2
  disk = 10
}

cidr_blocks = [ 
    ["10.32.1.0/24"],
    ["10.32.11.0/24"],
    ["10.32.111.0/24"]
    ]

labels = {
    "project"="slurm"
    "env"="lab"
}