output "vpc2_id" {
  value = aws_vpc.npd_vpc2.id
}

output "subnet_ids_public" {
  description = "Public Subnet ID's For EC2 Instance"
  value       = [for subnet in aws_subnet.Public_Subnet : subnet.id]
}

output "public_subnets_count" {

  value = length(aws_subnet.Public_Subnet)

}

output "subnet_ids_private" {
  description = "Public Subnet ID's For EC2 Instance"
  value       = [for subnet in aws_subnet.Private_Subnets : subnet.id]
}
