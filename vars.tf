variable "AWS_REGION" {    
    default = "us-east-2"
}

variable "AMI" {
    type = map
    default = {
        "eu-west-2" = "ami-03dea29b0216a1e03"
        "us-east-2" = "ami-0ccdf229a951fefb1"
    }
}

variable "PUBLIC_KEY_PATH" {
    default = "./B21-Terraform-KeyPair-Public.pem"
}

variable "PRIVATE_KEY_PATH" {
    default = "./B21-Terraform-KeyPair-Private.pem"
}

variable "EC2_USER" {
    default = "Administrator"
}
