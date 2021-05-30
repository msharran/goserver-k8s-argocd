variable "environment" {
  type = string
  default = "dev"
}

variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "aws_cli_profile" {
  type = string
  default = "default"
}

variable "eks_cluster_role_name" {
  type = string
  default = "goserver_cluster_role"
}

variable "eks_cluster_name" {
  type = string
  default = "goserver_cluster"
}

variable "eks_fargate_profile_name" {
  type = string
  default = "goserver_fargate_profile"
}

variable "subnet_ids" {
  type    = list(string)
  default = ["subnet-8d6cefeb", "subnet-1be56c3a", "subnet-801b49cd"]
}

variable "sg_worker_node" {
  type = string
  default = "worker_node_sg"
}

variable "vpc-id" {
  type = string
  default = "vpc-7116c90c"
}

variable "terraform_backend_s3_bucket_name" {
  type = string
  default = "goserver_tf_remote_backend_bucket"
}
