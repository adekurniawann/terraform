resource "alicloud_kvstore_instance" "xxxx_redis" {
  db_instance_name = "xxxx-${var.env}"
  vswitch_id       = var.network_vswitch_id
  security_ips = [var.vswitch_cidr_block]
  instance_type  = "Redis"
  engine_version = "5.0"
  capacity = 256
  config = {
    appendonly             = "yes",
    lazyfree-lazy-eviction = "yes",
    EvictionPolicy           = "volatile-lru",
    hash-max-ziplist-entries = "512",
    hash-max-ziplist-value   = "64",
    list-max-ziplist-entries = "512",
    list-max-ziplist-value   = "64",
    set-max-intset-entries   = "512",
    zset-max-ziplist-entries = "128",
    zset-max-ziplist-value   = "64",
  }
  # tags = {
  #   Created = "TF",
  #   For     = "Test",
  # }
  # resource_group_id         = "rg-123456"
  zone_id                   = "ap-southeast-5a"
  instance_class            = "redis.master.micro.default"
  private_connection_prefix = "redis-${var.env}"
  auto_renew = true
  auto_renew_period = 1
}
