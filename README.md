provider "aws" {
    
  region     = "us-west-2"
  access_key = ##########
  secret_key = @@@@@@@@@
}

resource "aws_instance" "newinstance" {
    ami = ami-0dbc3d7bc646e8516
    instance_type = "t2.micro"
}

resource "aws_vpc" "my-vpc" {
    cidr_block = "192.0.0.0/16"

    tags ={
        name = "my-vpc"
    }
  
}
resource "aws_subnet" "privet" {
    vpc_id = aws_vpc.my-vpc
    cidr_block = "192.0.0.1/24"
    availability_zone = "us-east-1a"
    tags = {
      name= "private-subnet1"
    }
  
}
resource "aws_subnet" "privet" {
    vpc_id = aws_vpc.my-vpc
    cidr_block = "192.0.0.3/24"
    
    availability_zone = "us-east-1b"
    tags = {
      name= "private-subnet2"
    }
  
}
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.my-vpc
    cidr_block = "192.0.0.3/24"
    availability_zone = "us-east-1a"
    tags = {
      name= "public-subnet1"
    }
  
}
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.my-vpc
    cidr_block = "192.0.0.4/24"
    availability_zone = "us-east-1b"
    tags = {
      name= "public-subnet2"
    }
  
}


