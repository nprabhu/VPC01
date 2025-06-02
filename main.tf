#VPC
module "vpc_2" {
  source           = "./modules/vpc"
  cidr_block_range = var.cidr_block_range
}


#Security Group
module "sg" {
  source                = "./modules/Security Group"
  vpc2_id               = module.vpc_2.vpc2_id
  public_ingress_ports  = var.public_ingress_ports
  private_ingress_ports = var.private_ingress_ports
  cidr_block_range      = var.cidr_block_range
  subnet_ids_private = module.vpc_2.subnet_ids_private
}


#EC2 Instances Block
