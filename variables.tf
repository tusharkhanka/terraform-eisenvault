variable "token" {
  default = "#############################"
}

variable "organization_key" {
  default = "##############################"
}

variable "region" {
  default = "par1" # Amsterdam region
}

variable "project" {
  default = "test"
}

variable "server_type" {
  default = "C2M" # Type of server
}

variable "storage" {
  default = 50
}

variable "volume_type" {
  default = "l_ssd"
}

variable "image_architecture" {
  default = "x86_64"
}

variable "image_name" {
  default = "Ubuntu Xenial"
}

#variable "scaleway_image_os_id" {
#    default = "Ubuntu Bionic Beaver"
#}

variable "do_ssh_public_key_id" {
  description = "SSH public key id"
  default     = "/var/jenkins_home/workspace/test-scw/id_rsa.pub"
}

variable "local_script_tar_path" {
  description = "Path to tar file"
  default     = "/var/jenkins_home/workspace/test-scw/raw"
}
