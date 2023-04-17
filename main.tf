provider "aws" {
region = "us-east-1"
access_key = "AKIAVUUKYWPTI4LPF36M"
secret_key = "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"
}

resource "aws_iam_group" "venna" {
    name = "venna"
}

resource "aws_iam_policy_attachment" "venna-attach" {
    name = "venna-attach"
    groups = ["${aws_iam_group.venna.name}"]
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_user" "admin1" {
    name = "ganesh"
}
resource "aws_iam_user" "admin2" {
    name = "arun"
}

resource "aws_iam_group_membership" "venna-users" {
    name = "venna-users"
    users = [
        "${aws_iam_user.admin1.name}",
        "${aws_iam_user.admin2.name}",
    ]
    group = "${aws_iam_group.venna.name}"
}
