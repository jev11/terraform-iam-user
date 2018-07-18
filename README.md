# Terraform module for configuring IAM in an AWS account

This terraform modules configures the following in IAM:

- Creates an IAM user account
- Creates a user group (optionally)
- Adds user into the admin group (optionally)
- Adds user into the read-only group (optionally)
- Creates a custom policy and assignes it to the user group (optionally). In order to create custom policy, create a custom-policy.json file and put in the root of the project. The file can also have a different name, but in that case specify `custom_policy_document_file_name` parameter.

All optional features are disabled by default.

## Usage

### Prerequisites

Admin and read-only groups must exist in the account. Execute [terraform-aws-account-setup](https://github.com/philips-software/terraform-aws-account-setup) module for the initial account setup.

## Inputs

| Name                             | Description                                             | Type   | Default              | Required |
| -------------------------------- | ------------------------------------------------------- | :----: | :------------------: | :------: |
| admin_group_name                 | Name of the manually configured admin group             | string | `admins`             | no       |
| custom_policy_document_file_name | Specifies the name of the policy document               | string | `custom-policy.json` | no       |
| group_name                       | IAM group name                                          | string |                      | no       |
| hasCustomPolicy                  | Specifies if user has customer policy                   | string | `false`              | no       |
| isAdmin                          | Specifies if user should be added into the admin group  | string | `false`              | no       |
| isViewer                         | Specifies  if user should be added into read-only group | string | `false`              | no       |
| user_name                        | IAM account name                                        | string |                      | yes      |
| viewer_group_name                | Name of the manually configured read-only group         | string | `read-only`          | no       |
