terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.58.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.31.0"
    }
  }
}

provider "aws" {
  region = var.region
}

provider "local" {

}

provider "kubernetes" {
  config_path            = "~/.kube/config"
  host                   = data.aws_eks_cluster.supracell.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.supracell.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.supracell.token
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", "${local.cluster_name}"]
    command     = "aws"
  }
}
