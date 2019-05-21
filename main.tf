provider "scaleway" {
  region = "${var.region}"
  organization = "${var.org}"
  token = "${var.tok}"
}

data "scaleway_image" "terraformana" {
  architecture = "x86_64"
  name         = "Ubuntu Bionic"
}

resource "scaleway_server" "terraformana" {
  name  = "terraformana"
  image = "${data.scaleway_image.terraformana.id}"
  type  = "START1-S"
}
resource "scaleway_ip" "ip" {
  server = "${scaleway_server.terraformana.id}"
}


resource "scaleway_volume" "terraformana" {
  name       = "terraformanavolume"
  size_in_gb = 50
  type       = "l_ssd"
}
