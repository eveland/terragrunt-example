# Indicate where to source the terraform module from.
# The URL used here is a shorthand for
# "tfr://registry.terraform.io/terraform-aws-modules/vpc/aws?version=3.5.0".
# Note the extra `/` after the protocol is required for the shorthand
# notation.
terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws?version=3.5.0"
}

# Indicate what region to deploy the resources into
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "us-east-1"
}
EOF
}

# Indicate the input values to use for the variables of the module.
inputs = {
  name = "single-instance"

  ami                    = "ami-03248a0341eadb1f1"
  instance_type          = "t2.micro"
  monitoring             = false
  vpc_security_group_ids = ["sg-31d90649"]
  subnet_id              = "vpc-4f1e392b"

  tags = {
    Terraform   = "true"
    Environment = "dev"
 }
}
