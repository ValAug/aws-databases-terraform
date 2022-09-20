#--main-docdb--

resource "aws_docdb_cluster" "doc_db" {
  cluster_identifier      = "docdb-cluster-name"
  engine                  = "docdb"
  master_username         = "user_name"
  master_password         = "Always_use_complex_password"
  backup_retention_period = 10
  preferred_backup_window = "00:00-01:00"
  skip_final_snapshot     = true
}