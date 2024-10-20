#Create Keygen in the same project file
#run this command in the cmd in the same dirctroy "ssh-keygen -t rsa -b 2048 -f 'key-name' "
resource "aws_key_pair" "my_key" {
  key_name   = var.keygyn-name
  public_key = file("${path.module}/${var.keygyn-name}.pub")
}

# Create an public EC2 instance
resource "aws_instance" "my_instance-01" {
  ami           = var.EC2-ami
  instance_type = var.EC2-family

  key_name = aws_key_pair.my_key.key_name

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  subnet_id                   = aws_subnet.subnet-01.id
  associate_public_ip_address = true
  tags = {
    Name = var.EC2-01
  }
}

# Create an private EC2 instance
resource "aws_instance" "my_instance-02" {
  ami           = var.EC2-ami
  instance_type = var.EC2-family

  key_name = aws_key_pair.my_key.key_name

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  subnet_id = aws_subnet.subnet-03.id
  tags = {
    Name = var.EC2-02
  }
}

# Output the instance's public IP
output "instance_public_ip1" {
  value = aws_instance.my_instance-01.public_ip
}
