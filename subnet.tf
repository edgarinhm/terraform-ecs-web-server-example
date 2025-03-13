resource "aws_subnet" "poweredge-ecs-subnet" {
  vpc_id            = aws_vpc.poweredge-ecs-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "poweredge-ecs-subnet"
  }

}

resource "aws_subnet" "poweredge-ecs-subnet-2" {
  vpc_id            = aws_vpc.poweredge-ecs-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-2b"

  tags = {
    Name = "poweredge-ecs-subnet-2"
  }

}
