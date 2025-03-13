variable "ecs_staging_port" {
  description = "The port the ECS service will listen on"
  type        = number
  default     = 5100
}

variable "poweredge_web_ecs_container_name" {
  description = "The name of the ECS container name"
  type        = string
  default     = "poweredge-web-ecs-container"
}

variable "poweredge_web_ecs_task_family" {
  description = "The name of the ECS task family"
  type        = string
  default     = "poweredge-web-ecs-task"
}
