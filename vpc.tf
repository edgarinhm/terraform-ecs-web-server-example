resource "aws_vpc" "poweredge-ecs-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "poweredge-ecs-vpc"
  }

}

resource "aws_route_table" "poweredge-ecs-route-table" {
  vpc_id = aws_vpc.poweredge-ecs-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.poweredge-ecs-igw.id
  }
}
