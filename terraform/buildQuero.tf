provider "aws"{
   region="us-east-1"
}

resource "aws_instance" "web"{
  ami="ami-029648cb961dbbd38"
  instance_type="t2.micro"

  tags= {
     Name="Desafio Quero"
  }
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id="sg-527b0c08"
  network_interface_id = "eth0"
}
