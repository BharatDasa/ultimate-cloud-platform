output "vpc_id" {

  value = aws_vpc.this.id
}

output "public_subnets" {

  value = aws_subnet.public[*].id
}

output "eks_cluster_security_group_id" {

  value = aws_security_group.eks_cluster.id
}

output "eks_nodes_security_group_id" {

  value = aws_security_group.eks_nodes.id
}