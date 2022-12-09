/*#Bastion Public IP
output "bastion_eip" {
  value = module.staging-webServer.bastion_eip
}
*/

output "bastioLoadBalancerApp_dns_name" {
  value = module.staging-webServer.LoadBalancerApp_dns_name
}