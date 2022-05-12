resource "aws_iam_policy" "B21SSMManagedInstancePolicy" {
  name = "B21SSMManagedInstancePolicy"
  description = "Policy to provide permissions to ec2"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
       "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": [
                    "s3:*",
                    "s3-object-lambda:*"
                ],
                "Resource": "*"
            },
            {
                "Effect": "Allow",
                "Action": [
                    "cloudwatch:PutMetricData",
                    "ds:CreateComputer",
                    "ds:DescribeDirectories",
                    "ec2:DescribeInstanceStatus",
                    "logs:*",
                    "ssm:*",
                    "ec2messages:*"
                ],
                "Resource": "*"
            },
            {
                "Effect": "Allow",
                "Action": "iam:CreateServiceLinkedRole",
                "Resource": "arn:aws:iam::*:role/aws-service-role/ssm.amazonaws.com/AWSServiceRoleForAmazonSSM*",
                "Condition": {
                    "StringLike": {
                        "iam:AWSServiceName": "ssm.amazonaws.com"
                    }
                }
            },
            {
                "Effect": "Allow",
                "Action": [
                    "iam:DeleteServiceLinkedRole",
                    "iam:GetServiceLinkedRoleDeletionStatus"
                ],
                "Resource": "arn:aws:iam::*:role/aws-service-role/ssm.amazonaws.com/AWSServiceRoleForAmazonSSM*"
            },
            {
                "Effect": "Allow",
                "Action": [
                    "ssmmessages:CreateControlChannel",
                    "ssmmessages:CreateDataChannel",
                    "ssmmessages:OpenControlChannel",
                    "ssmmessages:OpenDataChannel"
                ],
                "Resource": "*"
            },
            {
                "Effect": "Allow",
                "Action": "ssm:DescribeEffectivePatchesForPatchBaseline",
                "Resource": "arn:aws:ssm:*:*:patchbaseline/*"
            },
            {
                "Effect": "Allow",
                "Action": "ssm:GetPatchBaseline",
                "Resource": "arn:aws:ssm:*:*:patchbaseline/*"
            },
            {
                "Effect": "Allow",
                "Action": "tag:GetResources",
                "Resource": "*"
            },
            {
                "Effect": "Allow",
                "Action": "ssm:DescribePatchBaselines",
                "Resource": "*"
            }
        ]
    })

  tags = {
    tag-key = "B21SSMManagedInstancePolicy"
  }
}