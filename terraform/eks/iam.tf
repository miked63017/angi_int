module "iam_assumable_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"

  trusted_role_arns = [
    "arn:aws:iam::895879716483:root",
    "arn:aws:iam::895879716483:user/michael.donlon",
  ]

  create_role = true

  role_name         = "kube-admin"
}
