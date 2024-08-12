variable "cidr_block" {
  type = string
}

variable "subnet_count" {
  type    = number
  default = 2
}

variable "availability_zones" {
  type = list(string)
}

variable "environment" {
  type = string
}
variable "aws_region" {
  type = string
}

