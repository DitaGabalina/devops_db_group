output "cassandra_app_server_instance_id" {
  description = "ID of the EC2 cassandra_app_server instance"
  value       = aws_instance.cassandra_app_server.id
}

output "cassandra_app_server_instance_public_ip" {
  description = "Public IP address of the EC2 cassandra_app_server instance"
  value       = aws_instance.cassandra_app_server.public_ip
}

output "cassandra_db_node_1_instance_id" {
  description = "ID of the EC2 cassandra_db_node_1 instance"
  value       = aws_instance.cassandra_db_node_1.id
}

output "cassandra_db_node_1_instance_public_ip" {
  description = "Public IP address of the EC2 cassandra_db_node_1 instance"
  value       = aws_instance.cassandra_db_node_1.public_ip
}

output "cassandra_db_node_2_instance_id" {
  description = "ID of the EC2 cassandra_db_node_2 instance"
  value       = aws_instance.cassandra_db_node_2.id
}

output "cassandra_db_node_2_instance_public_ip" {
  description = "Public IP address of the EC2 cassandra_db_node_2 instance"
  value       = aws_instance.cassandra_db_node_2.public_ip
}

output "domain-name" {
  value = aws_instance.cassandra_app_server.public_dns
}

output "application-url" {
  value = "${aws_instance.cassandra_app_server.public_dns}/index.php"
}