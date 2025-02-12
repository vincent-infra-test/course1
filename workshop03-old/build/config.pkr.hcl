packer {
    required_plugins {
        digitalocean = {
            source = "github.com/hashicorp/digitalocean"
            version = ">= 1.0.0"
        }
        ansible = {
            source = "github.com/hashicorp/ansible"
            version = ">= 1"
        }
    }
}