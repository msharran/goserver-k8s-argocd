provider "aws" {
  region = var.aws_region
  profile = var.aws_cli_profile
}

terraform {
  required_version = ">= 0.12.6"
  backend "s3" {
    bucket = aws_s3_bucket.terraform-backend-bucket
    key = "eks-cluster/terraform.tfstate"
    region = var.aws_region
  }
}

resource "aws_s3_bucket" "terraform-backend-bucket" {
  bucket = var.terraform_backend_s3_bucket_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks_cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.eks_cluster.token
  load_config_file       = false
}