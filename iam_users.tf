# Definition of IAM users and groups

resource "aws_iam_user" "user01" {
  name = "user01"
}

resource "aws_iam_user" "user02" {
  name = "user02"
}

resource "aws_iam_group" "AmazonEC2ReadOnlyAccess"{
  name = "AmazonEC2ReadOnlyAccess"
}

# Assign users to group

resource "aws_iam_group_membership" "assignment"{
  name = "assignment"
  users = [aws_iam_user.user01.name,aws_iam_user.user02.name]
  group = aws_iam_group.AmazonEC2ReadOnlyAccess.name
}

#Attach policy to the group

resource "aws_iam_policy_attachment" "attachment"{
  name = "attachment"
  groups = [aws_iam_group.AmazonEC2ReadOnlyAccess.name]
  # The permission policy requires you to specify the resource using ARN format
  # arn:partition:service:region:account:resource
  policy_arn="arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}
