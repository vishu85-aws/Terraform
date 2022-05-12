resource "aws_instance" "B21_TESTWEB1" {
    ami = "${lookup(var.AMI, var.AWS_REGION)}"
    instance_type = "t2.medium"
    # VPC
    subnet_id = "${aws_subnet.Web-Subnet-003.id}"
    # Security Group
    vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
    # the Public SSH key
    key_name = "${aws_key_pair.B21-IIS-KeyPair.id}"
    # Attach IAM Instance Role
    iam_instance_profile = aws_iam_instance_profile.b21-ec2-profile.name
    # Create Tag for Instance
    tags = {
        Name = "B21-IIS-WebServer"
  }
    connection {
        user = "${var.EC2_USER}"
        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
        host        = self.public_ip
    }
}
## Sends your public key to the instance
resource "aws_key_pair" "B21-IIS-KeyPair" {
    key_name = "B21-IIS-KeyPair"
    public_key = "${file(var.PUBLIC_KEY_PATH)}"
}