variable "region"{
  type  = string
  default  = "us-east-1"
}
variable "ami_id" {
  type = map
  default = {
    us-east-1 = "ami-04505e74c0741db8d"
    eu-west-2 = "ami-0015a39e4b7c0966f"
    eu-central-1 = "ami-0d527b8c289b4af7f"
  }
}
variable "instance_type"{
  type = string
  default = "t2.micro"
}
variable "key_name" {
  type    = string
  default = "ec2-demo-ubuntu"
}
variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "10.0.0.0/16"
}
variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "enable_classiclink" {
  description = "Should be true to enable ClassicLink for the VPC. Only valid in regions and accounts that support EC2 Classic."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = string
  default     = "Vpc-custom-demo"
}
variable "custom_key_name" {
  type    = string
  default = ""
}
variable "public-key" {
  type    = string
  default = ""
}
variable "access-key" {
  type    = string
  default = ""
}
variable "secret-key" {
  type    = string
  default = ""
}



