module "vpc" {

  source = "./modules/vpc"

  project_name = var.project_name

  environment = var.environment

  vpc_cidr = var.vpc_cidr

  public_subnets = var.public_subnets

  availability_zones = var.availability_zones
}

module "eks" {

  source = "./modules/eks"

  project_name = var.project_name

  environment = var.environment

  cluster_name = var.cluster_name

  cluster_version = var.cluster_version

  vpc_id = module.vpc.vpc_id

  public_subnets = module.vpc.public_subnets

  eks_cluster_security_group_id = module.vpc.eks_cluster_security_group_id

  eks_nodes_security_group_id = module.vpc.eks_nodes_security_group_id

  node_instance_types = var.node_instance_types

  desired_size = var.desired_size

  min_size = var.min_size

  max_size = var.max_size
}

module "ecr" {

  source = "./modules/ecr"

  project_name = var.project_name

  environment = var.environment
} # trigger
