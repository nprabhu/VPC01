resource "aws_security_group" "npd_sg" {
  name = "Prabhu-sg"
  vpc_id = var.vpc2_id

  tags = {
    Name = "Allow Protocol"
  }
}
resource "aws_vpc_security_group_ingress_rule" "allow_public_ipv4" {
  for_each = var.public_ingress_ports
  security_group_id = aws_security_group.npd_sg.id
  ip_protocol       = "tcp"
  from_port         = each.value
  to_port           = each.value
  cidr_ipv4         = "0.0.0.0/0"
  description       = "Allow ${each.key} traffic on port ${each.value}"
}

resource "aws_vpc_security_group_ingress_rule" "allow_private_ipv4" {
  for_each = var.private_ingress_ports
  security_group_id = aws_security_group.npd_sg.id
  ip_protocol       = "tcp"
  from_port         = each.value
  to_port           = each.value
  cidr_ipv4         = var.cidr_block_range
  description       = "Allow ${each.key} traffic on port ${each.value}"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.npd_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
