provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-0ec10929233384c7f"
  instance_type          = "c7i-flex.large"
  key_name               = "loki"
  vpc_security_group_ids = ["sg-sg-05f5bb832bd30be40"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
