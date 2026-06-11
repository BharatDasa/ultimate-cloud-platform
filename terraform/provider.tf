provider "aws" {

  region = var.aws_region

  default_tags {

    tags = {

      Project     = var.project_name

      Environment = var.environment

      ManagedBy   = "Terraform"
    }
  }
}

provider "kubernetes" {

  host = module.eks.cluster_endpoint

  cluster_ca_certificate = base64decode(
    module.eks.cluster_certificate_authority_data
  )

  token = data.aws_eks_cluster_auth.this.token
}

provider "helm" {

  kubernetes {

    host = module.eks.cluster_endpoint

    cluster_ca_certificate = base64decode(
      module.eks.cluster_certificate_authority_data
    )

    token = data.aws_eks_cluster_auth.this.token
  }
}
