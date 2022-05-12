## Internet Gateway
resource "aws_internet_gateway" "B21-IGW" {
    vpc_id = "${aws_vpc.B21-Production-VPC.id}"
    tags = {
        Name = "B21-IGW"
    }
}

# Create EIP to use for NAT Gateway
resource "aws_eip" "nat_gateway" {
  vpc = true
}

# Create EIp to use for EC2 Instance
resource "aws_eip" "ec2-eip" {
  vpc = true
}

# Allocate EIP to EC2 Instance - B21_TESTWEB1
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.B21_TESTWEB1.id
  allocation_id = aws_eip.ec2-eip.id
  depends_on = [aws_internet_gateway.B21-IGW]
}

## NAT Gateway
resource "aws_nat_gateway" "B21-NAT" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.Web-Subnet-001.id

  tags = {
    Name = "B21-NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.B21-IGW]
}