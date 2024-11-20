# searches up the directory tree from the current terragrunt.hcl file and returns the absolute path to the first terragrunt.hcl
include {
  path = find_in_parent_folders()
}
