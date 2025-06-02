#EC2 resourece
resource "aws_instance" "npd_Instance01" {

    ami = "ami-084568db4383264d4"
    instance_type = "t2.micro"
    availability_zone = ""


    tags = {
      Name = "Instance 01"
    }

  
}