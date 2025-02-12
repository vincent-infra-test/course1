resource "digitalocean_ssh_key" "mynginx_key" {
    name = "mynginx_key"
    public_key = file(var.public_key)
}

resource "digitalocean_droplet" "mynginx" {
    name = "mynginx"
    image = var.droplet_image
    size = var.droplet_size
    region = var.droplet_region

    ssh_keys = [digitalocean_ssh_key.mynginx_key.id]

    connection {
        type = "ssh"
        user = "root"
        private_key = file(var.private_key)
        host = digitalocean_droplet.mynginx.ipv4_address
    }

    provisioner "remote-exec" {
      inline = [
        "apt update",
        "apt upgrade -y",
        "apt install nginx -y",
        "systemctl enable nginx",
        "systemctl start nginx"
      ]
    }

    provisioner "file" {
        source = "assets/hello.gif"
        destination = "/var/www/html/"
    }
}

resource "local_file" "index_html" {
    filename = "assets/index.html"
    file_permission = "0644"
    content = templatefile("assets/index.html.tftpl", {
        droplet_ip = digitalocean_droplet.mynginx.ipv4_address
    })
}

resource "local_file" "nginx_doc" {
    filename = "nginx-${digitalocean_droplet.mynginx.ipv4_address}.nip.io"
    content = ""
    file_permission = "0444"
}


output "mynginx_fingerprint" {
    value = digitalocean_ssh_key.mynginx_key.fingerprint
}

output "mynginx_ip_address" {
    value = digitalocean_droplet.mynginx.ipv4_address
}