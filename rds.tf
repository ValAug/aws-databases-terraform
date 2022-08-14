#--rds/main---

resource "aws_db_instance" "rds_instance" {
allocated_storage = 10
identifier = "rds-terraform-example"
storage_type = "gp2"
engine = "mysql"
engine_version = "5.7"
instance_class = "db.t2.micro"
db_name = "USES-YOUR-OWN-DB-NAME-HERE"
username = "username"
password = "Always_use_complex_password"
parameter_group_name = "default.mysql5.7"
skip_final_snapshot  = true

  tags = {
    Name = "RDS-DB-Example"
  }
}