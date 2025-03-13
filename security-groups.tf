resource "aws_security_group" "poweredge-ecs-sg" {
  description = "Security group for ECS Task"
  vpc_id      = aws_vpc.poweredge-ecs-vpc.id
}

resource "aws_security_group_rule" "poweredge-ecs-sg-allow-custom-ports" {
  security_group_id = aws_security_group.poweredge-ecs-sg.id
  type              = "ingress"
  from_port         = var.ecs_staging_port
  to_port           = var.ecs_staging_port
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}
