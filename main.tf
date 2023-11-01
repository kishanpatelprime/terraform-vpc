provider "aws" {
  region     = "us-west-2"
  access_key = "AKIAD7BFY"
  secret_key = "KRU1F"
}

resource "aws_instance" "newinstance" {
    ami = "0dbc3d7bc646e8516"  # we can use variable ami optiom as well
    instance_type = "t2.micro" 
}

resource "aws_vpc" "my-vpc" {
    cidr_block = "192.168.0.0/16"

    tags ={
        name = "my-vpc"
    }
  
}
resource "aws_subnet" "private1" {   # resource name must be unique
    vpc_id = "aws_vpc.my-vpc"
    cidr_block = "192.0.1.0/24"
    availability_zone = "us-west-2a"
    tags = {
      name= "private-subnet1"
    }
  
}
resource "aws_subnet" "private2" {
   vpc_id = "aws_vpc.my-vpc"
    cidr_block = "192.168.3.0/24"
    
    availability_zone = "us-west-2b"
    tags = {
      name= "private-subnet2"
    }
  
}
resource "aws_subnet" "public1" {
   vpc_id = "aws_vpc.my-vpc"
    cidr_block = "192.168.2.0/24"
    availability_zone = "us-west-2a"
    tags = {
      name= "public-subnet1"
    }
  
}
resource "aws_subnet" "public2" {
   vpc_id = "aws_vpc.my-vpc"
    cidr_block = "192.168.4.0/24"
    availability_zone = "us-west-2b"
    tags = {
      name= "public-subnet2"
    }
  
}
