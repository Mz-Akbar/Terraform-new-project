resource "aws_vpc" "myvpc"{
    cidr_block= "10.0.0.0/16"

    tags ={
        Name = "My-VPC"
    }
}

resource "aws_subnet" "Public-A"{
    vpc_id = aws_vpc.myvpc.id
    cidr_block= "10.0.1.0/24"
    availability_zone = "us-east-1a"
}

resource "aws_subnet" "Public-B"{
    vpc_id = aws_vpc.myvpc.id
    cidr_block= "10.0.2.0/24"
    availability_zone = "us-east-1b"
}


resource "aws_subnet" "Private-A"{
    vpc_id = aws_vpc.myvpc.id
    cidr_block= "10.0.3.0/24"
    availability_zone = "us-east-1a"
}

resource "aws_subnet" "Private-B"{
    vpc_id = aws_vpc.myvpc.id
    cidr_block= "10.0.4.0/24"
    availability_zone = "us-east-1b"
}

resource "aws_internet_gateway" "igw"{
    vpc_id = aws_vpc.myvpc.id

}

resource "aws_eip" "nat-eip" {
    domain = "vpc"
}

resource "aws_nat_gateway" "nat-gw" {
    allocation_id = aws_eip.nat-eip.id
    subnet_id = aws_subnet.Public-A.id
}

resource "aws_route_table" "Rt-public"{
    vpc_id = aws_vpc.myvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

}

resource "aws_route_table" "Rt-private" {
    vpc_id = aws_vpc.myvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat-gw.id
    }
}

resource "aws_route_table_association" "public-a"{
    route_table_id = aws_route_table.Rt-public.id
    subnet_id = aws_subnet.Public-A.id
}

resource "aws_route_table_association" "public-b"{
    route_table_id = aws_route_table.Rt-public.id
    subnet_id = aws_subnet.Public-B.id
}


resource "aws_route_table_association" "private-a"{
    route_table_id = aws_route_table.Rt-private.id
    subnet_id = aws_subnet.Private-A.id
}

resource "aws_route_table_association" "private-b"{
    route_table_id = aws_route_table.Rt-private.id
    subnet_id = aws_subnet.Private-B.id
}



