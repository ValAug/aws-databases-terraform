#---main/redshift---

# resource "aws_redshift_cluster" "example" {
#   cluster_identifier = "rds-terraform-example"
#   database_name      = "uses_your_own_db_name_here"
#   master_username    = "username"
#   master_password    = "Always_Use_Complex_Password_00"
#   node_type          = "dc1.large"
#   cluster_type       = "single-node"
# }