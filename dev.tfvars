vpc_cidr_block    = "10.0.0.0/16"
subnet_cidr_block = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
availability_zone = ["us-east-1a", "us-east-1b"]
ami               = "ami-02dfbd4ff395f2a1b" # Amazon Linux 2 AMI (HVM), SSD Volume Type
instance_type     = "t3.micro"
key_name          = "jupiter-keys" # Replace with your actual key pair name max_size                  = 6
max_size          = 6
min_size          = 2
desired_capacity  = 4
ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-Res-PQ-2025-09"
certificate_arn   = "arn:aws:acm:us-east-1:171239862305:certificate/423ee0b3-f93b-4c60-ad7e-accbd1699228"
route53_zone_id   = "Z09425701ZBOOY51HU7PN" # Replace with your actual hosted zone ID
name              = "www.elvictura.com"