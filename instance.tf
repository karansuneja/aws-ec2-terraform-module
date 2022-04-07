# Allocate Elastic IP Address (EIP 2)
# terraform aws allocate elastic ip
resource "aws_eip" "eip-for-ec2-1" {
  instance = aws_instance.ubuntu.id
  tags   = {
    Name = "EIP 2"
  }
}
#resource "aws_eip_association" "eip_assoc" {
 # instance_id   = aws_instance.ubuntu.id
 # allocation_id = aws_eip.eip-for-ec2-1.id
#}

resource "aws_instance" "ubuntu" {
  ami           = lookup(var.ami_id, var.region)
  instance_type = var.instance_type
# Public Subnet assign to instance
  subnet_id     = aws_subnet.public_1.id
  iam_instance_profile = aws_iam_instance_profile.s3-bucket-role-instance-profile.name
# Security group assign to instance
  vpc_security_group_ids=[aws_security_group.allow_ssh.id]

# key name
key_name = var.key_name

  tags = {
    Name = "Ec2-with-VPC"
  }
}

resource "aws_instance" "ubuntu-2" {
  ami           = lookup(var.ami_id, var.region)
  instance_type = var.instance_type

# Public Subnet assign to instance
  subnet_id     = aws_subnet.private_1.id

# Security group assign to instance
  vpc_security_group_ids=[aws_security_group.allow_ssh.id]

# key name
key_name = "aws_key"

  tags = {
    Name = "Ec2-with-VPC-private"
  }
}


resource "aws_key_pair" "deployer" {
  key_name   = var.custom_key_name
  public_key = var.public_key
}
