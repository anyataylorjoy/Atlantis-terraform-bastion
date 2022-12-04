provider "ncloud" {
  support_vpc = true
  access_key = "69D334F510417DAFF728"
  secret_key = "F1D01F28F1DBCB449198497F1DCEF0C3C0A05204"
  region     = "KR"
}

resource "ncloud_vpc" "vpc" {
  name            = "vpc-flagship"
  ipv4_cidr_block = "10.0.0.0/16"
}

resource "ncloud_subnet" "node_subnet" {
  vpc_no         = "23133"
  subnet         = "10.0.1.0/24"
  zone           = "KR-2"
  network_acl_no = "35053"
  subnet_type    = "PRIVATE"
  name           = "flagship-private1"
  usage_type     = "GEN"
}

resource "ncloud_login_key" "loginkey" {
  key_name = "vpc-flagship"
}

resource "ncloud_server" "server_" {
  subnet_no                 = "48730"
  name                      = "datalake-control-server"
  member_server_image_no    = "14952760"
  server_product_code       = "SVR.VSVR.HICPU.C002.M004.NET.SSD.B050.G002"
  login_key_name            = "vpc-flagship"
}

data "ncloud_server_image" "server_image" {
  filter {
    name = "os_information"
    values = ["CentOS 7.8 (64-bit)"]
  }
}
