output "server_ip" {
  description = "IP pública del servidor"
  value       = hcloud_server.vm.ipv4_address
}
