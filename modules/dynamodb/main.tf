resource "aws_dynamodb_table" "basic-dynamodb"{
    name = "Music"
    billing_mode = "PROVISIONED"
    read_capacity = 20
    write_capacity = 20
    hash_key = "Album"
    rang_key = "SongTitle"

    attribute {
        name = "Album"
        type = "S"
    }

    attribute {
        name = "SongTitle"
        type ="S"
    }

    attribute {
        name = "Date"
        type = "N"
    }

    tags = {
        Name = "dynamodb-table"
        Environment = "production"
    }
}


