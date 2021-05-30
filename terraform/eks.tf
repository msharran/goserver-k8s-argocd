module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.eks_cluster_name
  cluster_version = "1.20"
  subnets         = var.subnet_ids
  tags = {
    env = var.environment
  }
  vpc_id = var.vpc-id

  fargate_profiles = {
    default = {
      name = var.eks_fargate_profile_name
      selectors = [
        {
          namespace = "kube-system"
          labels = {
            k8s-app = "kube-dns"
          }
        },
        {
          namespace = "default"
          # Kubernetes labels for selection
           labels = {
             app = "goserver"
           }
        }
      ]

      # using specific subnets instead of all the ones configured in eks
      # subnets = ["subnet-0ca3e3d1234a56c78"]
      tags = {
        env = var.environment
      }
    }
  }
}

data "aws_eks_cluster" "eks_cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "eks_cluster" {
  name = module.eks.cluster_id
}