provider "aws" {
  region  = "eu-west-1"
  version = "1.27.0"
}

provider "template" {
  version = "1.0"
}

module "iam_user" {
  source = "../../terraform-iam-user"

  user_name                        = "test_user1"
  group_name                       = "test_group1"
  isAdmin                          = false
  isViewer                         = false
  admin_group_name                 = "admins"
  viewer_group_name                = "read-only"
  hasCustomPolicy                  = true
  custom_policy_document_file_name = "custom-policy.json"
}
