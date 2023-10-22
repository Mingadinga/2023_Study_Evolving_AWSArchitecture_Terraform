output "WebServerIP" {
    value = aws_eip.wpip.public_ip
    description = "Web Server IP Address"
}

output "DatabaseName" {
    value = aws_db_instance.wordpressbackend.db_name
    description = "The Database Name!"
}

output "DatabaseUserName" {
    value = aws_db_instance.wordpressbackend.username
    description = "The Database Name!"
}

output "DBConnectionString" {
    value = aws_db_instance.wordpressbackend.endpoint
    description = "The Database connection String!"
}