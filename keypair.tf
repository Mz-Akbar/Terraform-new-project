resource "tls_private_key" "my_key"{
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "aws_key_pair" "GeneretedKey"{
    key_name = "MyKeyPair"
    public_key = tls_private_key.my_key.public_key_openssh
}

