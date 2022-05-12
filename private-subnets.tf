## Private Subnet
resource "aws_subnet" "DB-Subnet" {
    vpc_id = "${aws_vpc.B21-Production-VPC.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-2b"
    tags = {
        Name = "DB Subnet"
    }
}

resource "aws_subnet" "Bastion-Subnet" {
    vpc_id = "${aws_vpc.B21-Production-VPC.id}"
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-2b"
    tags = {
        Name = "Bastion Subnet"
    }
}