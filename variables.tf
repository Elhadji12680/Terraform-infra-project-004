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
variable "private_subnet_az_1a_id" {
  type = string
}
variable "public_subnet_az_1a_id" {
  type = string
}
variable "private_subnet_az_1b_id" {
  type = string
}