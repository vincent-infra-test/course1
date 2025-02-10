variable "DO_key" {
    type = string
    description = "DO Key"
    default = "set this"
    sensitive = true
}

variable "servers" {
    type = map(
        object( {
            size = string
            image = string
            region = string
        })
    )
    default = {
        server-512mb = {
            size = "s-1vcpu-512mb-10gb"
            image = "ubuntu-20-04-x64"
            region = "sgp1"
        },
        server-1gb = {
            size = "s-1vcpu-1gb"
            image = "ubuntu-24-10-x64"
            region = "sgp1"
        }
    }
}

variable "public_key_name" {
    type = string
    default = "Vince-SSH"
}

variable "instance_count" {
    type = number  
    default = 2
}

variable "droplet_size" {
    type = string
    default ="	s-1vcpu-1gb"
}

variable "droplet_image" {
    type = string
    default = "ubuntu-20-04-x64"
}

variable "droplet_region" {
    type = string
    default = "sgp1"
}
