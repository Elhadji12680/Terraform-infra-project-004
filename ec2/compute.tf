resource "aws_security_group" "bastion_host_sg" {
  name        = "bastion_host_sg"
  description = "Allow SSH traffic"
  vpc_id      = var.vpc_id

   tags = merge(var.tags, {
  Name = "${var.tags["project"]}-${var.tags["application"]}-${var.tags["environment"]}-bastion-host-sg"
})
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.bastion_host_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_using_ssh" {
  security_group_id = aws_security_group.bastion_host_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

#CREATING BATION HOST---------------------------------------- --------------------------------------------------------------------------
resource "aws_instance" "bastion_host" {
  ami           = var.bastion_host_ami
  instance_type = var.bastion_host_instance_type
  subnet_id     = var.subnet_id
  security_groups = [aws_security_group.bastion_host_sg.id]
  key_name = var.key_name
  associate_public_ip_address = true
  
   tags = merge(var.tags, {
  Name = "${var.tags["project"]}-${var.tags["application"]}-${var.tags["environment"]}-bastion-host"
   })
}
