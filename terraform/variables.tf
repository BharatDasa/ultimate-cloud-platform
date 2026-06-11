variable "aws_region" {

  type = string
}

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

variable "vpc_cidr" {

  type = string
}

variable "public_subnets" {

  type = list(string)
}

variable "availability_zones" {

  type = list(string)
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