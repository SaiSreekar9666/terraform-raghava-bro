output "vpc_id" {
    value = var.vpc_id
    description = "value of the vpc"
  
}
output "aws_eks_cluster" {
    value = var.aws_eks_cluster
    description = "value of the eks-cluster"
  
}
output "aws_iam_role" {
    value = var.aws_iam_role
    description = "value of the iam-role"
  
}
output "eks_worker_node_policy" {
    value = var.eks_worker_node_policy
    description = "value of the policy-arn for worker-node-policy"
  
}
output "eks_cni_policy" {
    value = var.eks_cni_policy
    description = "value of the eks-cni-policy"
  
}
output "AmazonEC2ContainerRegistryReadOnly" {
    value = var.AmazonEC2ContainerRegistryReadOnly
    description = "value of the AmazonEC2ContainerRegistryReadOnly"
  
}
output "desired_size" {
    value = var.desired_size
    description = "value of the desired-size"

  
}
output "max_size" {
    value = var.max_size
    description = "value of the max-size"

  
}
output "min_size" {
    value = var.min_size
    description = "value of the min-size"
  
}