data "digitalocean_ssh_key" "coursekey" {
    name = var.public_key_name
}

/*
resource "digitalocean_droplet" "droplet-day1" {
    name = "droplet-day1-${count.index}"
    count = var.instance_count
    image = var.droplet_image
    size = var.droplet_size
    region = var.droplet_region
    ssh_keys = [ data.digitalocean_ssh_key.coursekey.id ]
}
*/

resource "digitalocean_droplet" "droplet-day1" {
    for_each = var.servers
    name = each.key
    //count = var.instance_count
    image = each.value.image
    size = each.value.size
    region = each.value.region
    ssh_keys = [ data.digitalocean_ssh_key.coursekey.id ]
}

/*
resource "local_file" "name" {
    filename = "droplets_ips.txt"
    content = templatefile("droplets_ips.txt.tftpl", {
        droplets_ips = digitalocean_droplet.droplet-day1[*].ipv4_address
    })
}*/

output "coursekey_fingerprint" {
    description = "Fingerprint of public key"
    value = data.digitalocean_ssh_key.coursekey.fingerprint
}

output "coursekey_pubkey" {
    value = data.digitalocean_ssh_key.coursekey.public_key
}

/*
output "droplet-day1-ipv4" {
    value = digitalocean_droplet.droplet-day1[*].ipv4_address
}
*/

output "droplet-day1-ipv4" {
    value = join (",", [for d in digitalocean_droplet.droplet-day1:d.ipv4_address])
}


