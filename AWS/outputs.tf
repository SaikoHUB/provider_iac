output "instance_public_ip" {
  value = aws_instance.web_server.public_ip
  description = "L'adresse IP publique de l'inst"
}