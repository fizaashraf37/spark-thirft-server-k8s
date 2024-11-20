module "trust_rel" {
  source      = "../../../../../../../terraform_modules/k8s/trust_relationship"
  k8s_cluster = local.k8s_cluster
}

# use this to populate tags
# Example:
# tags = merge(local.tags, { Name = "my_resource" })
locals {
  tags = {
    terraform = "true"
    env       = var.env
    team      = var.team
  }
  k8s_cluster        = "stg"
  assume_role_policy = module.trust_rel.assume_role_policy
}
