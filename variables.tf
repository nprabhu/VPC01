variable "cidr_block_range" {
  type        = string
  description = "VPC CIDR RANGE"
}

# variable "ingress_ports" {
#   type = map(number)

# }


variable "public_ingress_ports" {
  type = map(number)
  description = "Ports open to the public internet"
}

variable "private_ingress_ports" {
  type = map(number)
  description = "Ports open only to private CIDR ranges"
}

