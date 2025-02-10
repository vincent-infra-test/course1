terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
    }
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.48.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

provider "local" {
}

provider "digitalocean" {
  token = var.DO_key
}
