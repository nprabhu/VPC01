variable "vpc2_id" {
  type        = string
  description = "vpc id for security group"
}

# variable "ingress_ports" {
#   type    = map(number)
# }

variable "cidr_block_range" {
  type        = string
  description = "VPC CIDR Block Range"
}


variable "public_ingress_ports" {
  type = map(number)
  description = "Ports open to the public internet"
}

variable "private_ingress_ports" {
  type = map(number)
  description = "Ports open only to private CIDR ranges"
}


variable "subnet_ids_private" {
  type = list(string)
  description = "Public Subnet ID's For Security Group"
}