variable "vpc_cidr_block" {
  type = string
}

variable "subnet_cidr_block" {
  type = list(string)

}
variable "availability_zone" {
  type = list(string)
}
variable "ami" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "key_name" {
  type = string
}

variable "max_size" {
  type = number
} 
variable "min_size" {
  type = number
}
variable "desired_capacity" {
  type = number
}