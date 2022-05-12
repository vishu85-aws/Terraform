## Public Subnet
resource "aws_subnet" "Web-Subnet-001" {
    vpc_id = "${aws_vpc.B21-Production-VPC.id}"
    cidr_block = "10.0.0.0/24"
    map_public_ip_on_launch = "false" //if true, it makes this a public subnet
    availability_zone = "us-east-2b"
    tags = {
        Name = "Web Subnet 001 - Test & Prod Web Servers"
    }
}

resource "aws_subnet" "Web-Subnet-002" {
    vpc_id = "${aws_vpc.B21-Production-VPC.id}"
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "false" //if true, it makes this a public subnet
    availability_zone = "us-east-2b"
    tags = {
        Name = "Web Subnet 002"
    }
}


resource "aws_subnet" "Web-Subnet-003" {
    vpc_id = "${aws_vpc.B21-Production-VPC.id}"
    cidr_block = "10.0.5.0/24"
    map_public_ip_on_launch = "false" //if true, it makes this a public subnet
    availability_zone = "us-east-2b"
    tags = {
        Name = "Web Subnet 003"
    }
}

resource "aws_subnet" "bastion-pub" {
    vpc_id = "${aws_vpc.B21-Production-VPC.id}"
    cidr_block = "10.0.4.0/24"
    map_public_ip_on_launch = "false" //if true, it makes this a public subnet
    availability_zone = "us-east-2b"
    tags = {
        Name = "bastion-pub"
    }
}
