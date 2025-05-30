# locals {
#   azs = data.aws_availability_zones.available.names
# }

# locals {
#   subnets_tags = [for i in range(1, 6) : {
#     Name        = "Webserver-0${i}"
#     Environment = "Production"
#   }]
# }