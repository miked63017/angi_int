terraform {
  backend "s3" {
    bucket = "ang-eks-int-state"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}
