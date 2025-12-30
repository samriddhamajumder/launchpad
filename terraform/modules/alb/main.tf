resource "aws_lb" "this" {
  name               = "${var.project}-${var.environment}-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnets

  tags = {
    Project     = var.project
    Environment = var.environment
  }
}
