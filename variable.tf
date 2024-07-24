variable "aws_access_key" {
  description = "Access key"
  type        = string
}

variable "aws_secret_key" {
  description = "secretkey"
  type        = string
}

variable "aws_region" {
  description = "Region of aws"
  type        = string
  default     = "us-east-1"
}
variable "vpc_id" {
  description = "value for the vpc-id"
  type = string
  default = "lms-vpc"
  
}
variable "aws_eks_cluster" {
  description = "value for the eks-cluster"
  type = string
  default = "lms-eks-cluster"
  
}
variable "aws_iam_role" {
  description = "value for the eks-role"
  type = string
  default = "lms-cluster-role"
  
}

variable "eks_worker_node_policy" {
  description = "value of the node-policy"
  type = string
  default = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  
}
variable "eks_cni_policy" {
  description = "value for the eks-cni-policy"
  type = string
  default = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  
}
variable "AmazonEC2ContainerRegistryReadOnly" {
  description = "value for the amaxonec2-container-registry-read-only"
  type = string
  default = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  
}
variable "desired_size"{
  description = "value for the scaling-config"
  type = string
  default = "2"
  
}
variable "max_size" {
  description = "value of the max-size"
  type = string
  default = "2"
  
}
variable "min_size" {
  description = "value of the min-size"
  type = string
  default = "1"
  
}