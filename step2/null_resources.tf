resource "null_resource" "configweb12" {
  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("/Users/minhwi/.ssh/ec2-ssh.pem")
    host     = aws_eip.wpip.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
      "sudo wget https://wordpress.org/wordpress-5.7.2.tar.gz",
      "sudo tar -xzf wordpress-5.7.2.tar.gz",
      "sudo cp -r wordpress/* /var/www/html/"
    ]
  }
  
}

resource "null_resource" "configphp" {

  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("/Users/minhwi/.ssh/ec2-ssh.pem")
    host     = aws_eip.wpip.public_ip

    }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y amazon-linux-extras",
      "sudo amazon-linux-extras enable php7.2",
      "sudo yum clean metadata -y",
      "sudo yum install php-cli php-pdo php-fpm php-json php-mysqlnd -y",
      "sudo systemctl restart httpd"
    ]
  }
  
}