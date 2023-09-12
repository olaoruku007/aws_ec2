data "aws_key_pair" "Dev_KP_OH" {
  key_name   = "Dev_KP_OH"

}


resource "aws_instance" "class-webserver" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name   = "Dev_KP_OH"
  vpc_security_group_ids = [aws_security_group.SG.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo dnf update -y
              sudo dnf install httpd -y
              sudo systemctl enable httpd
              sudo systemctl start httpd
              EOF

  tags = {
    Name = "terraform-class-webserver"
  }
  
}

resource "aws_security_group" "SG" {
  name = "Terraform-webserver-SG"

  ingress {
    protocol  = "tcp"
    from_port = var.server_port
    to_port   = var.server_port
    cidr_blocks = ["0.0.0.0/0"]

  
  }


  ingress {
    protocol  = "tcp"
    from_port = var.server_port2
    to_port   = var.server_port2
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    protocol  = "tcp"
    from_port = var.server_port3
    to_port   = var.server_port3
    cidr_blocks = ["0.0.0.0/0"]
  }




  egress {
    from_port   = var.server_port1
    to_port     = var.server_port1
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

   
  }
}