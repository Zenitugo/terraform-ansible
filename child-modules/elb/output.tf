
# Output load balancer name
output "alb-name" {
  value = var.alb-name
}


#########################################################################################################
##########################################################################################################

# Output target group arn
output "alb-tg-arn" {
  value = aws_lb_target_group.my-tg.arn
}


#############################################################################################################
############################################################################################################

# Output load balancer dns name
output "application-load_balancer_dns_name" {
  value = aws_lb.application-load-balancer.dns_name
}

####################################################################################################################
####################################################################################################################
 
# Output load balancer zone id

output "application-load_balancer_zone_id" {
  value = aws_lb.application-load-balancer.zone_id
}

######################################################################################################################
#####################################################################################################################

# Output the id of the security group of the load balancer
output "alb-sg-id" {
  value = aws_security_group.alb.id
}