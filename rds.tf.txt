resource "aws_db_subnet_group" "subnet-group"{
	name = "db-subnet-group"
	subnet_ids = [aws_subnet.Private-A.id]
}

resource "aws_db_instance" "mydb"{
	allocated_storage = 20
	storage_type = "gp2"
	engine = "mysql"
	engine_version = "8.0.41"
	instance_class = "db.t3.micro"
	db_name = "Mydb"
	username = "my-db-instance"
	password = "password123"
	db_subnet_group_name = aws_db_subnet_group.subnet-group.name
	vpc_security_group_ids = [aws_security_group.sg.id]
	skip_final_snapshot = true
}