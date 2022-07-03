output "apache_server_instance_id" {
  description = "ID of the EC2 apache_server instance"
  value       = aws_instance.apache_server.id
}
output "apache_server_instance_public_ip" {
  description = "Public IP address of the EC2 apache_server instance"
  value       = aws_instance.apache_server.public_ip
}

output "domain-name" {
  value = aws_instance.apache_server.public_dns
}

output "application-url" {
  value = "${aws_instance.apache_server.public_dns}/index.php"
}