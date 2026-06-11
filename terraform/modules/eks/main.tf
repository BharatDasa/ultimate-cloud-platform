resource "aws_eks_cluster" "this" {

  name = var.cluster_name

  role_arn = aws_iam_role.eks_cluster_role.arn

  version = var.cluster_version

  vpc_config {

    subnet_ids = var.public_subnets

    security_group_ids = [
      var.eks_cluster_security_group_id
    ]

    endpoint_private_access = false

    endpoint_public_access = true
  }

  depends_on = [

    aws_iam_role_policy_attachment.eks_cluster_policy
  ]
}

resource "aws_eks_node_group" "this" {

  cluster_name = aws_eks_cluster.this.name

  node_group_name = "${var.cluster_name}-node-group"

  node_role_arn = aws_iam_role.eks_node_role.arn

  subnet_ids = var.public_subnets

  instance_types = var.node_instance_types

  scaling_config {

    desired_size = var.desired_size

    min_size = var.min_size

    max_size = var.max_size
  }

  ami_type = "AL2_x86_64"

  capacity_type = "ON_DEMAND"

  disk_size = 20

  tags = {

    "k8s.io/cluster-autoscaler/enabled" = "true"

    "k8s.io/cluster-autoscaler/${var.cluster_name}" = "owned"
  }

  depends_on = [

    aws_iam_role_policy_attachment.eks_worker_node_policy,

    aws_iam_role_policy_attachment.eks_cni_policy,

    aws_iam_role_policy_attachment.ec2_container_registry_readonly,

    aws_iam_role_policy_attachment.cluster_autoscaler_policy
  ]
}
