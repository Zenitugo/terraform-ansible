# Create application load balancer

resource "aws_lb" "application-load-balancer" {

  name               = var.alb-name
  internal           = false
  load_balancer_type = var.load_balancer_type
  security_groups    = [aws_security_group.alb.id]
  subnets            = [var.public_subnet_id-a, var.public_subnet_id-b, var.public_subnet_id-c]

  enable_deletion_protection = false

  tags = {
      Name = var.alb-name
    }
}

###########################################################################################################################
##################################################################################################################################

# Create a target group
resource "aws_lb_target_group" "my-tg" {
  name        = var.alb-tg
  target_type = var.target_type
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id

  health_check {
    path                = "/"
    interval            = 300
    port                = 80
    protocol            = "HTTP"
    enabled             = true
    timeout             = 60
    matcher             = 200
    unhealthy_threshold = 5
    healthy_threshold   = 5
  }

  lifecycle {
    create_before_destroy = true
  }
}

##################################################################################################################################################################
##################################################################################################################################################################

# Create a target group attachment
resource "aws_lb_target_group_attachment" "attachment" {
  count = 3
  target_group_arn = aws_lb_target_group.my-tg.arn
  target_id        = var.instance-id[count.index]
  port             = 80
}


##################################################################################################################################################################
##################################################################################################################################################################

# Create a forward listener
resource "aws_lb_listener" "alb-http" {
  load_balancer_arn = aws_lb.application-load-balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn =  aws_lb_target_group.my-tg.arn
  }

}


######################################################################################################################################################
######################################################################################################################################################

# Create Security group for alb
resource "aws_security_group" "alb" {
  name        = "${var.alb-name}-sg"
  description = "aws load balancer security group"
  vpc_id      = var.vpc_id

  ingress {
    description = "http access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }



  ingress {
    description = "https access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.alb-name}-sg"
  }
}
