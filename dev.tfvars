vpc_cidr_block    = "10.0.0.0/16"
subnet_cidr_block = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
availability_zone = ["us-east-1a", "us-east-1b"]
ami               = "ami-02dfbd4ff395f2a1b" # Amazon Linux 2 AMI (HVM), SSD Volume Type
instance_type     = "t3.micro"
key_name          = "jupiter-keys" # Replace with your actual key pair name max_size                  = 6
 max_size         = 6
  min_size        = 2