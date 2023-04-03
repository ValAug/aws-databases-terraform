#--main/elasticcached

resource "aws_elasticache_cluster" "memcached_engine" {
  cluster_id           = "cluster-memcached"
  engine               = "memcached"
  node_type            = "cache.m4.large"
  num_cache_nodes      = 4
  parameter_group_name = "default.memcached1.4"
  port                 = 11211
}

resource "aws_elasticache_cluster" "redis_engine" {
  cluster_id           = "cluster-redis"
  engine               = "redis"
  node_type            = "cache.m4.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  engine_version       = "3.2.10"
  port                 = 6379
}