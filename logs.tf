resource "aws_cloudwatch_log_group" "ecs-poweredge-web-ecs-cluster-tf" {
  name = "ecs/poweredge-web-ecs-cluster-tf"

  tags = {
    Environment = "staging"
    Application = "poweredgeWebServer"
  }
}
