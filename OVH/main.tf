terraform {
  required_providers {
    ovh = {
      source = "ovh/ovh"
    }
  }
}

provider "ovh" {
  endpoint           = "ovh-eu"
  application_key    = "key"
  application_secret = "appsecret"
  consumer_key       = "consumerkey"
}

resource "ovh_cloud_project_instance" "web_server" {
  service_name = var.service_name
  name         = "web_server_ovh"
  region       = var.region
  flavor_name  = var.flavor
  image_name   = "Ubuntu 22.04"
  key_pair     = "votre_nom_de_cle_ssh_ovh"

network {
    name = "Ext-Net"
  }
}