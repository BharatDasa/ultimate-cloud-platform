output "vpc_id" {

  value = module.vpc.vpc_id
}

output "public_subnets" {

  value = module.vpc.public_subnets
}

output "cluster_name" {

  value = module.eks.cluster_name
}

output "cluster_endpoint" {

  value = module.eks.cluster_endpoint
}

output "frontend_ecr_repository_url" {

  value = module.ecr.frontend_repository_url
}

output "backend_ecr_repository_url" {

  value = module.ecr.backend_repository_url
}