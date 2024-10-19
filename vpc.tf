data "alicloud_zones" "default" {
  available_disk_category     = "cloud_efficiency"
  available_resource_creation = "VSwitch"
}


# Create a new ECS instance for VPC
resource "alicloud_vpc" "vpc" {
  vpc_name   = "myvpc2"
  cidr_block = "10.0.0.0/8"
}

resource "alicloud_vswitch" "public" {
  vpc_id       = alicloud_vpc.vpc.id
  cidr_block   = "10.0.8.0/24"
  zone_id      = data.alicloud_zones.default.zones.0.id
#   vswitch_name = "public-vswitch"
}








