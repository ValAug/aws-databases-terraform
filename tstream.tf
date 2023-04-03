#--timestream--

resource "aws_timestreamwrite_database" "timestream_database" {
  database_name = "timestream-database-iot"

  tags = {
    Name = "timestream-database-iot"
  }
}


resource "aws_timestreamwrite_table" "timestream_table" {
  database_name = aws_timestreamwrite_database.timestream_database.database_name
  table_name = "timestream-database-iot-table"
}