variable "location" {
  description = "Region Azure"
  default     = "France Central"
}

variable "resource_group_name" {
  description = "Nom du conteneur de ressources"
  default     = "tp-azure-rg"
}

variable "vm_size" {
  description = "Taille de l instance"
  default     = "Standard_B1s"
}