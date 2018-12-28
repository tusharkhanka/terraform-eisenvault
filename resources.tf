#provider "scaleway" {
#organization = "${var.organization_key}"
#token        = "${var.token}"
#  region       = "${var.region}"
#}


resource "scaleway_ip" "Test" {}

# Architecture and image name
data "scaleway_image" "os" {
  architecture = "${var.image_architecture}"
  name         = "${var.image_name}"
  most_recent  = true
}

# Create machine
resource "scaleway_server" "Test" {
  name           = "${var.project}"
  image          = "${data.scaleway_image.os.id}"
  type           = "${var.server_type}"
  security_group = "${scaleway_security_group.Test_security.id}"
  public_ip      = "${scaleway_ip.Test.ip}"
  #volumes        = ["${scaleway_volume.Test.id}"]
  volume {
    #name       = "${var.project}"
    size_in_gb = "${var.storage}"
    type       = "${var.volume_type}"
  } 

  connection {
    type        = "ssh"
    user        = "root"
    #host_key    = "2048 a1:56:f2:8c:f6:46:01:b3:0c:39:ef:08:bd:d2:7b:2d  evadm@ubuntu-xenial (RSA)"
    private_key = "${file("{PATH TO}id_rsa")}"
    agent       = false
  }

  provisioner "local-exec" {
    command = "echo 'sleeping'"
  }

  provisioner "local-exec" {
    command = "echo 'done sleeping'"
  }

  provisioner "file" {
    source      = "${var.local_script_tar_path}"
    destination = "/tmp"
    connection {
    type        = "ssh"
    user        = "root"
    private_key = "${file("{PATH TO}id_rsa")}"
    agent       = false
  }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo bash /tmp/raw/install-ev.sh",
    ]
  }
  #provisioner "remote-exec" {
  #inline = [
  #  "sudo reboot",
  #  ]
  #}
}
#resource "scaleway_bucket" "Test" {
#  name = "sample-bucket"
#}

resource "scaleway_security_group" "Test_security" {
  name        = "Test_security"
  description = "Allow SSH traffic"
}

resource "scaleway_security_group_rule" "ssh_accept" {
  security_group = "${scaleway_security_group.Test_security.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"
  port      = 22
}

resource "scaleway_security_group_rule" "Http" {
  security_group = "${scaleway_security_group.Test_security.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"
  port      = 80
}

resource "scaleway_security_group_rule" "No_ssl" {
  security_group = "${scaleway_security_group.Test_security.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"
  port      = 8080
}


resource "scaleway_security_group_rule" "https" {
  security_group = "${scaleway_security_group.Test_security.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"
  port      = 443
}
