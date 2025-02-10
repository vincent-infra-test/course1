variable "DO_key" {
    type = string
    description = "DO Key"
    default = "set this"
    sensitive = true
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
