provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-0b6d9d3d33ba97d99"
  instance_type          = "c7i-flex.large"
  key_name               = "junks"
  vpc_security_group_ids = ["sg-0a1fb8aa0587d50af"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
