variable "allocated_storage" {
  type = number
}

variable "instance_class" {
  type = string
}

variable "db_name" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

variable "parameter_group_name" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "subnet_group" {
  type = string
}

variable "publicly_accessible" {
  type    = bool
  default = false
}

