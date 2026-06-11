variable "project_name" {

  type = string
}

variable "environment" {

  type = string
}

variable "cluster_name" {

  type = string
}

variable "cluster_version" {

  type = string
}

variable "vpc_id" {

  type = string
}

variable "public_subnets" {

  type = list(string)
}

variable "eks_cluster_security_group_id" {

  type = string
}

variable "eks_nodes_security_group_id" {

  type = string
}

variable "node_instance_types" {

  type = list(string)
}

variable "desired_size" {

  type = number
}

variable "min_size" {

  type = number
}

variable "max_size" {

  type = number
}