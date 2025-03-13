resource "aws_iam_role" "poweredge-web-ecs-task-execution-role" {
  name               = "ecs-task-execution-role-tf"
  assume_role_policy = <<EOF
  {
      "Version": "2012-10-17",
      "Statement": [
          {
              "Effect": "Allow",
              "Principal": {
                  "Service": "ecs-tasks.amazonaws.com"
              },
              "Action": "sts:AssumeRole"
          }
      ]
  }
  EOF

  tags = {
    Environment = "staging"
  }
}

resource "aws_iam_role_policy_attachment" "poweredge-web-ecs-task-execution-role-policy-attach" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  role       = aws_iam_role.poweredge-web-ecs-task-execution-role.name

}
