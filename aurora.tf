#---aurora/main--

# resource "aws_rds_cluster_instance" "cluster_instances" {
#   count              = 1
#   identifier         = "aurora-cluster-example-${count.index}"
#   cluster_identifier = aws_rds_cluster.my_rds.id
#   instance_class     = "db.r4.large"
#   engine             = aws_rds_cluster.my_rds.engine
#   engine_version     = aws_rds_cluster.my_rds.engine_version
# }

# resource "aws_rds_cluster" "my_rds" {
#   cluster_identifier = "aurora-cluster-example"
#   availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
#   database_name      = "USES-YOUR-OWN-DB-NAME-HERE"
#   master_username    = "username"
#   master_password    = "Always_use_complex_password"
# }