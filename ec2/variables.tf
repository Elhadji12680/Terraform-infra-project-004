variable "vpc_id" {
  type = string
}
variable "tags" {
  type = map(string)
}

variable "bastion_host_ami" {
    type = string
}
variable "bastion_host_instance_type" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "key_name" {
  type = string
}