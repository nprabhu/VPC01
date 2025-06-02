

locals {
  subnets_all = concat(var.subnet_ids_public, var.subnet_ids_private)
  azs         = data.aws_availability_zones.available.names
}


#EC2 resourece
resource "aws_instance" "npd_Instance01" {

  ami               = "ami-084568db4383264d4"
  instance_type     = "t2.micro"
  availability_zone = ""
  security_groups   = ""
  tags = {
    Name = "Instance 01"
  }


}
