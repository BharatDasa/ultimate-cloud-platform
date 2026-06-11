resource "aws_iam_policy" "cluster_autoscaler" {

  name = "${var.project_name}-cluster-autoscaler-policy"

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Action = [

          "autoscaling:DescribeAutoScalingGroups",

          "autoscaling:DescribeAutoScalingInstances",

          "autoscaling:DescribeLaunchConfigurations",

          "autoscaling:DescribeScalingActivities",

          "autoscaling:SetDesiredCapacity",

          "autoscaling:TerminateInstanceInAutoScalingGroup",

          "ec2:DescribeLaunchTemplateVersions"
        ]

        Resource = "*"
      }
    ]
  })
}
