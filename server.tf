# variable "ec2_ami" {
#   description = "The AMI to use for the EC2 instance"
#   default     = "ami-0c55b159cbfafe1f0"
# }
# variable "ec2_type" {
#   description = "The type of EC2 instance to launch"
#   default     = "t2.micro"
# }

# resource "aws_instance" "poweredge-web-server" {
#   ami           = var.ec2_ami
#   instance_type = var.ec2_type

#   network_interface {
#     device_index         = 0
#     network_interface_id = aws_network_interface.poweredge-web-ecs-server-nic.id
#   }

#   tags = {
#     Name = "poweredge-web-ecs-server"
#   }
# }
