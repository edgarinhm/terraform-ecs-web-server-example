resource "aws_lb" "poweredge-web-ecs-alb" {
  name               = "poweredge-web-ecs-alb-tf"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.poweredge-ecs-sg.id]
  subnets            = [aws_subnet.poweredge-ecs-subnet.id, aws_subnet.poweredge-ecs-subnet-2.id]

  tags = {
    Environment = "staging"
  }

}

resource "aws_alb_target_group" "poweredge-web-ecs-alb-tg" {
  name        = "poweredge-web-ecs-alb-tg-tf"
  port        = var.ecs_staging_port
  protocol    = "HTTP"
  vpc_id      = aws_vpc.poweredge-ecs-vpc.id
  target_type = "ip"

  health_check {
    path                = "/"
    protocol            = "HTTP"
    port                = "traffic-port"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 4
    interval            = 5
  }

  tags = {
    Environment = "staging"
  }

}

resource "aws_alb_listener" "poweredge-web-ecs-alb-listener" {
  load_balancer_arn = aws_lb.poweredge-web-ecs-alb.arn
  port              = var.ecs_staging_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.poweredge-web-ecs-alb-tg.arn
  }

}
