data "digitalocean_ssh_key" "coursekey" {
    name = var.public_key_name
}


resource "digitalocean_droplet" "droplet-day1" {
    name = "droplet-day1"
    image = var.droplet_image
    size = var.droplet_size
    region = var.droplet_region
    ssh_keys = [ data.digitalocean_ssh_key.coursekey.id ]
}


output "coursekey_fingerprint" {
    description = "Fingerprint of public key"
    value = data.digitalocean_ssh_key.coursekey.fingerprint
}

output "coursekey_pubkey" {
    value = data.digitalocean_ssh_key.coursekey.public_key
}


output "droplet-day1-ipv4" {
    value = digitalocean_droplet.droplet-day1.ipv4_address
}


