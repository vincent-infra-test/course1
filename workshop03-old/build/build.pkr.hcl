source digitalocean my_snapshot {
  api_token = var.DO_key
  image = var.droplet_image
  size = var.droplet_size
  region = var.droplet_region
  snapshot_name = var.my_snapshot
  ssh_username = "root"
}

build {
  sources = [ "source.digitalocean.my_snapshot" ]

  provisioner ansible {
    playbook_file = "build/playbook.yaml"
    inventory_file = "build/inventory.yaml"
  }
}