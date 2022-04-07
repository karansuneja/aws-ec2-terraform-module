resource "aws_security_group" "allow_ssh" {
  name        = "allow_SSH"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.vpc_demo.id

  egress {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      protocol         = "-1"  #-1 is the way how you allow all traffic
      to_port          = 0
    }
  ingress {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 22
     protocol         = "tcp"
     to_port          = 22
   }
}
