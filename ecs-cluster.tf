resource "aws_ecs_cluster" "poweredge-web-ecs-cluster" {
  name = "poweredge-web-ecs-cluster-tf"
}

resource "aws_ecs_task_definition" "poweredge-web-ecs-task" {
  family                   = var.poweredge_web_ecs_task_family
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.poweredge-web-ecs-task-execution-role.arn
  task_role_arn            = aws_iam_role.poweredge-web-ecs-task-execution-role.arn
  cpu                      = 1024
  memory                   = 2048
  container_definitions = jsonencode(
    [
      {
        name      = var.poweredge_web_ecs_container_name
        image     = "${aws_ecr_repository.poweredge-web-ecr.repository_url}:latest"
        cpu       = 1024
        memory    = 2048
        essential = true
        portMappings = [
          {
            containerPort = var.ecs_staging_port
            hostPort      = var.ecs_staging_port
            protocol      = "tcp"
          }
        ]
        logConfiguration = {
          logDriver = "awslogs"
          options = {
            "awslogs-group"         = "/ecs/${var.poweredge_web_ecs_task_family}"
            "awslogs-region"        = "us-west-2"
            "awslogs-stream-prefix" = "ecs"
          }
        }
      }
  ])
}

resource "aws_ecs_service" "poweredge-web-ecs-service" {
  name            = "poweredge-web-ecs-service-tf"
  cluster         = aws_ecs_cluster.poweredge-web-ecs-cluster.id
  task_definition = aws_ecs_task_definition.poweredge-web-ecs-task.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  network_configuration {
    subnets          = [aws_subnet.poweredge-ecs-subnet.id, aws_subnet.poweredge-ecs-subnet-2.id]
    security_groups  = [aws_security_group.poweredge-ecs-sg.id]
    assign_public_ip = true
  }
  load_balancer {
    target_group_arn = aws_alb_target_group.poweredge-web-ecs-alb-tg.arn
    container_name   = var.poweredge_web_ecs_container_name
    container_port   = var.ecs_staging_port
  }
}
