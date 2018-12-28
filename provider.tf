provider "scaleway" {
  organization = "${var.organization_key}"
  token        = "${var.token}"
  region       = "${var.region}"
}
