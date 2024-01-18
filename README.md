# TERRAFORM-ANSIBLE PROJECT

## PROJECT TASK
This is a two-fold task.
### TERRAFORM
- Using Terraform, create 3 EC2 instances and put them behind an Elastic Load Balancer.
- Make sure that after applying your plan, Terraform exports the public IP addresses of the 3 instances to a file called host-inventory
- Get a .com.ng or any other domain name for yourself (be creative, this will be a domain you can keep using) and set it up with AWS Route53 within your terraform plan, then add an A record for subdomain terraform-test
 that points to your ELB IP address.

### ANSIBLE
- Create an Ansible script that uses the host-inventory file Terraform created to install Apache, set the timezone to Africa/Lagos, and display a simple HTML page containing content to identify all 3 EC2 instances.


*NOTE:* Your project is complete when one visits terraform-test.yoursdomain.com and it shows the content from your instances while rotating between the servers as you refresh to display their unique content.


Check here for a breakdown of the solution: [Documentation.md](https://github.com/Zenitugo/terraform-ansible/blob/master/documentation.md)
