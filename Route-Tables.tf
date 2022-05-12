## Main Route Table
resource "aws_route_table" "B21-Main-RT" {
    vpc_id = "${aws_vpc.B21-Production-VPC.id}"
    
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0" 
        //CRT uses this IGW to reach internet
        gateway_id = "${aws_internet_gateway.B21-IGW.id}" 
    }
    
    tags = {
        Name = "B21-Main-RT"
    }
}

## Associate Subnets with Public Access
resource "aws_route_table_association" "B21-rta-public-web-subnet-001"{
    subnet_id = "${aws_subnet.Web-Subnet-001.id}"
    route_table_id = "${aws_route_table.B21-Main-RT.id}"
}

resource "aws_route_table_association" "B21-rta-public-web-subnet-002"{
    subnet_id = "${aws_subnet.Web-Subnet-002.id}"
    route_table_id = "${aws_route_table.B21-Main-RT.id}"
} 

resource "aws_route_table_association" "B21-rta-public-web-subnet-003"{
    subnet_id = "${aws_subnet.Web-Subnet-003.id}"
    route_table_id = "${aws_route_table.B21-Main-RT.id}"
} 

resource "aws_route_table_association" "B21-rta-public-bastion-pub"{
    subnet_id = "${aws_subnet.bastion-pub.id}"
    route_table_id = "${aws_route_table.B21-Main-RT.id}"
} 

## NAT Routung Table
resource "aws_route_table" "B21-NAT-RT" {
    vpc_id = "${aws_vpc.B21-Production-VPC.id}"
    
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0" 
        //CRT uses this NAT to reach internet
        gateway_id = "${aws_nat_gateway.B21-NAT.id}" 
    }
    
    tags = {
        Name = "B21-NAT-RT"
    }
}

## Associate Subnets with NAT Access
## Add subnets as neccessary
