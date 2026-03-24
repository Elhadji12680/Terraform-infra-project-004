variable "vpc_cidr_block" {
  type = string
}

variable "subnet_cidr_block" {
  type = list(string)

}
variable "availability_zone" {
  type = list(string)
}
variable "bastion_host_ami" {
  type = string
}
variable "bastion_host_instance_type" {
  type = string
}
variable "key_name" {
  type = string
}