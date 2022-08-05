resource "aws_ecs_cluster" "kien-ecs-cluster" {
  name = "${var.name}-ecs-cluster"

  tags = {
    Name        = "${var.name}-ecs-cluster"
    GBL_CLASS_0 = var.GBL_CLASS_0
    GBL_CLASS_1 = var.GBL_CLASS_1
  }
}

resource "aws_ecs_task_definition" "kien-td" {
  family                   = "${var.name}-td"
  task_role_arn            = var.iam_role_arn
  execution_role_arn       = var.iam_role_exec_arn
  network_mode             = "awsvpc"
  cpu                      = "2048"
  memory                   = "4096"
  requires_compatibilities = ["FARGATE"]
  container_definitions = jsonencode([{
    name   = "kien-ecr",
    image  = "256598433840.dkr.ecr.ap-northeast-1.amazonaws.com/kien-ecr:latest",
    cpu    = 1024,
    memory = 2048,
    portMappings = [{
      containerPort = 80
      hostPort      = 80
    }]
  }])

  tags = {
    Name        = "${var.name}-td"
    GBL_CLASS_0 = var.GBL_CLASS_0
    GBL_CLASS_1 = var.GBL_CLASS_1
  }
}

resource "aws_ecs_service" "kien-ecs-service" {
  name            = "${var.name}-ecs-service"
  cluster         = aws_ecs_cluster.kien-ecs-cluster.id
  task_definition = aws_ecs_task_definition.kien-td.id
  desired_count   = "1"
  launch_type     = "FARGATE"
  network_configuration {
    subnets         = [var.prisub_a, var.prisub_c]
    security_groups = [var.ecs-sg-id]
  }
  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "kien-ecr"
    container_port   = "80"
  }

  tags = {
    Name        = "${var.name}-ecs-service"
    GBL_CLASS_0 = var.GBL_CLASS_0
    GBL_CLASS_1 = var.GBL_CLASS_1
  }
}
