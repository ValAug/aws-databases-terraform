#--timestream--

resource "aws_timestreamwrite_database" "timestream_database" {
  database_name = "timestream-database-iot"

  tags = {
    Name = "timestream-database-iot"
  }
}