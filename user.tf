resource "aws_iam_user" "user" {
  name          = "${var.user_name}"
  path          = "/"
  force_destroy = true
}

resource "aws_iam_group" "group" {
  count = "${var.group_name != "" ? 1 : 0 }"
  name  = "${var.group_name}"
}

resource "aws_iam_user_group_membership" "group_membership" {
  count = "${var.group_name != "" ? 1 : 0 }"
  user  = "${aws_iam_user.user.name}"

  groups = [
    "${aws_iam_group.group.name}",
  ]
}

resource "aws_iam_user_group_membership" "admin_membership" {
  count = "${var.isAdmin}"
  user  = "${aws_iam_user.user.name}"

  groups = [
    "${var.admin_group_name}",
  ]
}

resource "aws_iam_user_group_membership" "viewer_membership" {
  count = "${var.isViewer}"
  user  = "${aws_iam_user.user.name}"

  groups = [
    "${var.viewer_group_name}",
  ]
}

resource "aws_iam_group_policy_attachment" "custom_policy_attachment" {
  count = "${var.hasCustomPolicy}"

  group      = "${aws_iam_group.group.name}"
  policy_arn = "${aws_iam_policy.custom_policy.arn}"
}

data "template_file" "custom_policy_document" {
  count = "${var.hasCustomPolicy}"

  template = "${file("custom-policy.json")}"
}

resource "aws_iam_policy" "custom_policy" {
  count = "${var.hasCustomPolicy}"

  name        = "${aws_iam_group.group.name}_custom_policy"
  path        = "/"
  description = "Custom policy for group ${aws_iam_group.group.name}"

  policy = "${data.template_file.custom_policy_document.rendered}"
}
