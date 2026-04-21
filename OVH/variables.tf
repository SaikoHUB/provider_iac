variable "region" {
  description = "Region OVHcloud"
  default     = "GRA7"
}

variable "flavor" {
  description = "Type de serveur d2-2 est l equivalent du t3.micro"
  default     = "d2-2" 
}

variable "service_name" {
  description = "ID de votre projet Public Cloud"
  default     = "votre_id_projet_ici"
}