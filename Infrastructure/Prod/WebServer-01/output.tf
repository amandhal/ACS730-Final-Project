/*#Bastion Public IP
output "bastion_eip" {
  value = module.prod-webServer.bastion_eip
}
*/

output "bastioLoadBalancerApp_dns_name" {
  value = module.prod-webServer.LoadBalancerApp_dns_name
}