resource "aws_network_interface" "poweredge-web-ecs-server-nic" {
  subnet_id   = aws_subnet.poweredge-ecs-subnet.id
  private_ips = ["10.0.1.20"]
  tags = {
    Name = "poweredge-web-ecs-server-nic"
  }

}
