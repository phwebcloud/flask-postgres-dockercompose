provider "aws"{
   region="us-east-1"
}

resource "aws_instance" "web"{
  ami="COLE AQUI SUA AMI"
  instance_type="t2.micro"

  tags= {
     Name="App Python"
  }
}

resource "aws_security_group" "sg_app" {
  name        = "SG APP"
  description = "ALLOW HTTP TRAFFIC"

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "SG APP"
  }
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.sg_app.id
  network_interface_id = aws_instance.web.primary_network_interface_id
}

output "ec2instance" {
  value = aws_instance.web.public_ip
}

output "ec2instance_dns" {
  value = aws_instance.web.public_dns
}
