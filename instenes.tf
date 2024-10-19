resource "alicloud_instance" "web" {
  # cn-beijing
  availability_zone = data.alicloud_zones.avalible_zones.zones.0.id
  security_groups   = [alicloud_security_group.public_SG.id]

  # series III
  instance_type              = "ecs.g6.large"
  system_disk_category       = "cloud_essd"
  system_disk_size           = 40
  image_id                   = "ubuntu_24_04_x64_20G_alibase_20240812.vhd"
  instance_name              = "lab2_web"
  vswitch_id                 = alicloud_vswitch.public.id
  internet_max_bandwidth_out = 100
  internet_charge_type       = "PayByTraffic"
  instance_charge_type       = "PostPaid"
  key_name                   = alicloud_ecs_key_pair.lab_key.key_pair_name
  user_data                  = base64encode(file("nginx.sh"))
}

output "instance_ip_addr" {
  value = alicloud_instance.web.public_ip
}