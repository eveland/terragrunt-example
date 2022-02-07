# Indicate where to source the terraform module from.
# The URL used here is a shorthand for
# "tfr://registry.terraform.io/terraform-aws-modules/vpc/aws?version=3.5.0".
# Note the extra `/` after the protocol is required for the shorthand
# notation.
terraform {
  source = "tfr:///terraform-aws-modules/key-pair/aws?version=1.0.1"
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
  key_name   = "tg-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCjq8CvaSDr2FmPrk0GIqIIJGgUrLBnkxeCjMUpQNLf0luYfhXsAYDlxYOpM1QX5mFOQ/Et+WFvGcjDdcm59Rm0H4wCShmzcye0FnCBpAjlRohzYc8+byx2jZHU/g/b0SOGsSN3Dhyw+X9QpuPtrvYmw2ZZcqyNdQp0YZDbtOBeaei2GDwgbyghNeobYr4/oLlLG3QzbAhrb0D6hBOGF31nEddbJuyu8iFRhMpIXjjrFzhev8tyRDoRVDydDNdHhv5MRkn/yEFVLnUOVLca40DyaCkN1sViNo++vCh0QyIQuRDro2Es3t/OrnbgNT7V+KpUTJJt8IYV/8zRnziYdn9eT8O3iMY5Lk2QHfDq4F8DZWHNnxzdKe6uStj7d2eTyXwwW8GrckaceqA61Yf0s1YbjlzrHGgKTZWXJqcwYCF1HPfxR6sGewpoY2DmGIl05oOsmfQC/DmBspBSqiC+gmqYeMcsKOETVSRnKMAtRITD5fSITq0DT8K1vXOunVRjxnlXIKFRbBjK3Spled528QTxm/mMbAKqB70AJCTKqnpdzkjAmGob+nWpxKBd42g1PgGItvKi4oIKwkO53Fbekh7S6mQ+5cgIkLwNYLbOQr0X4TcC8meVF9D2XmIh7SrXjxcK2VqXnsiuHWFN13UIWWmW2gY5BNH2KNhjDpYrrp/btw== your_email@example.com"
  tags = {
    Terraform   = "true"
    Environment = "dev"
 }
}
