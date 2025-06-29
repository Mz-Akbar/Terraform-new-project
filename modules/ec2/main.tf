resource "aws_instance" "EC2-1"{
    ami = "ami-09e6f87a47903347c"
    instance_type = "t2.micro"
    subnet_id = aws_vpc.myvpc.id
    vpc_security_group_ids =[aws_security_group.sg.id]
    key_name = aws_key_pair.GeneretedKey.key_name
    associate_public_ip_address = true

    tags = {
        Name = "EC2-1"
    }
}