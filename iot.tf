#--iot/main--

resource "aws_iot_thing" "iot_core" {
  name = "your-iot-core-thing"
}


resource "aws_iot_certificate" "iot_certificate" {
  active = true
}


resource "aws_iot_thing_principal_attachment" "iot_attachment" {
  principal = aws_iot_certificate.iot_certificate.arn
  thing = aws_iot_thing.iot_core.name
}



resource "aws_iot_topic_rule" "iot_rule" {
  name = "myiotrule"
  sql = "SELECT * FROM 'iot-core-topic'"
  sql_version = "2016-03-23"
  enabled     = true
  description = "Send data from the AWS IoT Core to AWS Timestream"
}


resource "aws_iam_policy" "iot_timestream_policy" {
  name = "iot-timestream-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "timestream:WriteRecords"
        ]
        Resource = [
          "${aws_timestreamwrite_database.timestream_database.arn}"
        ]
      }
    ]
  })
}

resource "aws_iot_policy_attachment" "iot_policy_attachment" {
  policy = aws_iam_policy.iot_timestream_policy.name
  target = aws_iot_certificate.iot_certificate.arn
}