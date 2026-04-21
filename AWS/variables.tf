variable "region" {
  description = "Region AWS pour le déploiement"
  default     = "eu-west-3"
}

variable "instance_type" {
  description = "Type de l instance EC2"
  default     = "t3.micro"
}