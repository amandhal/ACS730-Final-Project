/*#Bastion Elastic  IP
output "bastion_eip" {
  value = aws_eip.bastion_eip.public_ip
}
*/


#LoadBalancerApp_dns_name
output "LoadBalancerApp_dns_name" {
  value       = aws_lb.LoadBalancerApp.dns_name
}