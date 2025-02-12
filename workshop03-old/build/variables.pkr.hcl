variable "DO_key" {
  type = string 
  default = "dop_v1_f5be8ef4525e28a8bd1c25e1d2733f7c5cdf64899cae99b0045d4373c1244874"
  sensitive = true
}
variable "droplet_image" {
  type = string 
  default = "ubuntu-20-04-x64"
}
variable "droplet_region" {
  type = string 
  default = "sgp1"
}
variable "droplet_size" {
  type = string 
  default = "s-1vcpu-1gb"
}
variable "my_snapshot" {
  type = string
  default = "ws3-snapshot"
}