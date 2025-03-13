resource "aws_internet_gateway" "poweredge-ecs-igw" {
  tags = {
    Name = "poweredge-ecs-igw"
  }
}

resource "aws_internet_gateway_attachment" "poweredge-ecs-igw-attachment" {
  vpc_id              = aws_vpc.poweredge-ecs-vpc.id
  internet_gateway_id = aws_internet_gateway.poweredge-ecs-igw.id
}
