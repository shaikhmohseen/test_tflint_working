##################################################################################
# VARIABLES
#############################################################################


##################################################################################
# PROVIDERS
##################################################################################
provider "aws" {
  profile = "deep-dive"
  region  = "ap-south-1"
}
##################################################################################
# DATA
##################################################################################



data "aws_a mi" "aws-linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {


    name   = "name"
    values = ["amzn-ami-hvm*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


##################################################################################
# RESOURCES
##################################################################################

#This uses the default VPC.  It WILL NOT delete it on destroy.
resource "aws_vpc" "myvpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = "true"
  tags = {
    "Name" = "myvpc"
  }

}


data "aws_availability_zones" "available" {}

resource "aws_subnet" "public-subnet" {
  cidr_block              = "10.0.0.0/28"
  vpc_id                  = aws_vpc.myvpc.id
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = "true"
  tags = {
    "Name" = "public-subnet"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id


}
resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

}
resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.rtb.id

}




resource "aws_security_group" "allow_ssh" {
  name        = "security_group_for_ngnix"
  description = "Allow ports for nginx demo"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "Linux" {
  ami                    = data.aws_ami.aws-linux.id
  instance_type          = "t2.micro"
  key_name               = var.key_name
  subnet_id              = aws_subnet.public-subnet.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]



  tags = {
    "Name" = "Linux"
  }

}

##################################################################################
# OUTPUT
##################################################################################

output "aws_instance_public_dns" {
  value = aws_instance.Linux.public_dns
}
