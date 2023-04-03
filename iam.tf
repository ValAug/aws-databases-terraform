resource "aws_iam_role" "iot_role" {
  name = "iot-role"

  assume_role_policy   = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "iot.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

resource "aws_iam_policy" "iot_role_publish_policy" {
    name = "iot-publish-policy"

    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "iot:Publish",
            "Resource": "*"
        }
    ]
}
EOF

}

resource "aws_iam_policy" "iot_timestream_policy" {
  name        = "iot-timestream-motion-policy"
  description = "iot role timestream write policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Effect": "Allow",
          "Action": [
              "timestream:WriteRecords"
          ],
          "Resource": [
            "${aws_timestreamwrite_table.timestream_table.arn}"
          ]
      },
      {
          "Effect": "Allow",
          "Action": [
              "timestream:DescribeEndpoints",
              "timestream:SelectValues",
              "iotevents:BatchPutMessage"
          ],
          "Resource": "*"
      }
  ]
}
EOF

}

resource "aws_iam_role_policy_attachment" "iot_role_policy_attch" {
    role = aws_iam_role.iot_role.name
    policy_arn = aws_iam_policy.iot_timestream_policy.arn
  
}