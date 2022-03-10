terraform {
  required_providers {
    aws =  {
    source = "hashicorp/aws"
    version = ">= 2.7.0"
    }
  }
}

provider "aws" {
    region = "us-west-2"
}

resource "aws_s3_bucket" "terraform_backend_bucket" {
      bucket = "terraform-state-tehjzbmv68unudngp5rlyyn1wi9s2wmsn14jj8hlaidg1"
}

resource "aws_instance" "servers" {
      ami = data.aws_ami.amazon_latest.id
      instance_type = "t2.micro"
      lifecycle {
        ignore_changes = [ami]
      }
      subnet_id = aws_subnet.devxp_vpc_subnet_public0.id
      associate_public_ip_address = true
      vpc_security_group_ids = [aws_security_group.devxp_security_group.id]
      iam_instance_profile = aws_iam_instance_profile.servers_iam_role_instance_profile.name
}

resource "aws_eip" "servers_eip" {
      instance = aws_instance.servers.id
      vpc = true
}

resource "aws_iam_user" "servers_iam" {
      name = "servers_iam"
}

resource "aws_iam_user_policy_attachment" "servers_iam_policy_attachment0" {
      user = aws_iam_user.servers_iam.name
      policy_arn = aws_iam_policy.servers_iam_policy0.arn
}

resource "aws_iam_policy" "servers_iam_policy0" {
      name = "servers_iam_policy0"
      path = "/"
      policy = data.aws_iam_policy_document.servers_iam_policy_document.json
}

resource "aws_iam_access_key" "servers_iam_access_key" {
      user = aws_iam_user.servers_iam.name
}

resource "aws_instance" "servers-a" {
      ami = data.aws_ami.amazon_latest.id
      instance_type = "t2.micro"
      lifecycle {
        ignore_changes = [ami]
      }
      subnet_id = aws_subnet.devxp_vpc_subnet_public0.id
      associate_public_ip_address = true
      vpc_security_group_ids = [aws_security_group.devxp_security_group.id]
      iam_instance_profile = aws_iam_instance_profile.servers-a_iam_role_instance_profile.name
}

resource "aws_eip" "servers-a_eip" {
      instance = aws_instance.servers-a.id
      vpc = true
}

resource "aws_iam_user" "servers-a_iam" {
      name = "servers-a_iam"
}

resource "aws_iam_user_policy_attachment" "servers-a_iam_policy_attachment0" {
      user = aws_iam_user.servers-a_iam.name
      policy_arn = aws_iam_policy.servers-a_iam_policy0.arn
}

resource "aws_iam_policy" "servers-a_iam_policy0" {
      name = "servers-a_iam_policy0"
      path = "/"
      policy = data.aws_iam_policy_document.servers-a_iam_policy_document.json
}

resource "aws_iam_access_key" "servers-a_iam_access_key" {
      user = aws_iam_user.servers-a_iam.name
}

resource "aws_instance" "servers-b" {
      ami = data.aws_ami.amazon_latest.id
      instance_type = "t2.micro"
      lifecycle {
        ignore_changes = [ami]
      }
      subnet_id = aws_subnet.devxp_vpc_subnet_public0.id
      associate_public_ip_address = true
      vpc_security_group_ids = [aws_security_group.devxp_security_group.id]
      iam_instance_profile = aws_iam_instance_profile.servers-b_iam_role_instance_profile.name
}

resource "aws_eip" "servers-b_eip" {
      instance = aws_instance.servers-b.id
      vpc = true
}

resource "aws_iam_user" "servers-b_iam" {
      name = "servers-b_iam"
}

resource "aws_iam_user_policy_attachment" "servers-b_iam_policy_attachment0" {
      user = aws_iam_user.servers-b_iam.name
      policy_arn = aws_iam_policy.servers-b_iam_policy0.arn
}

resource "aws_iam_policy" "servers-b_iam_policy0" {
      name = "servers-b_iam_policy0"
      path = "/"
      policy = data.aws_iam_policy_document.servers-b_iam_policy_document.json
}

resource "aws_iam_access_key" "servers-b_iam_access_key" {
      user = aws_iam_user.servers-b_iam.name
}

resource "aws_instance" "servers-c" {
      ami = data.aws_ami.amazon_latest.id
      instance_type = "t2.micro"
      lifecycle {
        ignore_changes = [ami]
      }
      subnet_id = aws_subnet.devxp_vpc_subnet_public0.id
      associate_public_ip_address = true
      vpc_security_group_ids = [aws_security_group.devxp_security_group.id]
      iam_instance_profile = aws_iam_instance_profile.servers-c_iam_role_instance_profile.name
}

resource "aws_eip" "servers-c_eip" {
      instance = aws_instance.servers-c.id
      vpc = true
}

resource "aws_iam_user" "servers-c_iam" {
      name = "servers-c_iam"
}

resource "aws_iam_user_policy_attachment" "servers-c_iam_policy_attachment0" {
      user = aws_iam_user.servers-c_iam.name
      policy_arn = aws_iam_policy.servers-c_iam_policy0.arn
}

resource "aws_iam_policy" "servers-c_iam_policy0" {
      name = "servers-c_iam_policy0"
      path = "/"
      policy = data.aws_iam_policy_document.servers-c_iam_policy_document.json
}

resource "aws_iam_access_key" "servers-c_iam_access_key" {
      user = aws_iam_user.servers-c_iam.name
}

resource "aws_s3_bucket" "devxp-class-storage" {
      bucket = "devxp-class-storage"
}

resource "aws_s3_bucket_public_access_block" "devxp-class-storage_access" {
      bucket = aws_s3_bucket.devxp-class-storage.id
      block_public_acls = true
      block_public_policy = true
}

resource "aws_iam_user" "devxp-class-storage_iam" {
      name = "devxp-class-storage_iam"
}

resource "aws_iam_user_policy_attachment" "devxp-class-storage_iam_policy_attachment0" {
      user = aws_iam_user.devxp-class-storage_iam.name
      policy_arn = aws_iam_policy.devxp-class-storage_iam_policy0.arn
}

resource "aws_iam_policy" "devxp-class-storage_iam_policy0" {
      name = "devxp-class-storage_iam_policy0"
      path = "/"
      policy = data.aws_iam_policy_document.devxp-class-storage_iam_policy_document.json
}

resource "aws_iam_access_key" "devxp-class-storage_iam_access_key" {
      user = aws_iam_user.devxp-class-storage_iam.name
}

resource "aws_s3_bucket" "devxp-class-storage-a" {
      bucket = "devxp-class-storage-a"
}

resource "aws_s3_bucket_public_access_block" "devxp-class-storage-a_access" {
      bucket = aws_s3_bucket.devxp-class-storage-a.id
      block_public_acls = true
      block_public_policy = true
}

resource "aws_iam_user" "devxp-class-storage-a_iam" {
      name = "devxp-class-storage-a_iam"
}

resource "aws_iam_user_policy_attachment" "devxp-class-storage-a_iam_policy_attachment0" {
      user = aws_iam_user.devxp-class-storage-a_iam.name
      policy_arn = aws_iam_policy.devxp-class-storage-a_iam_policy0.arn
}

resource "aws_iam_policy" "devxp-class-storage-a_iam_policy0" {
      name = "devxp-class-storage-a_iam_policy0"
      path = "/"
      policy = data.aws_iam_policy_document.devxp-class-storage-a_iam_policy_document.json
}

resource "aws_iam_access_key" "devxp-class-storage-a_iam_access_key" {
      user = aws_iam_user.devxp-class-storage-a_iam.name
}

resource "aws_dynamodb_table" "database" {
      name = "database"
      hash_key = "username"
      billing_mode = "PAY_PER_REQUEST"
      ttl {
        attribute_name = "TimeToExist"
        enabled = true
      }
      attribute {
        name = "username"
        type = "S"
      }
}

resource "aws_iam_user" "database_iam" {
      name = "database_iam"
}

resource "aws_iam_user_policy_attachment" "database_iam_policy_attachment0" {
      user = aws_iam_user.database_iam.name
      policy_arn = aws_iam_policy.database_iam_policy0.arn
}

resource "aws_iam_policy" "database_iam_policy0" {
      name = "database_iam_policy0"
      path = "/"
      policy = data.aws_iam_policy_document.database_iam_policy_document.json
}

resource "aws_iam_access_key" "database_iam_access_key" {
      user = aws_iam_user.database_iam.name
}

resource "aws_iam_instance_profile" "servers_iam_role_instance_profile" {
      name = "servers_iam_role_instance_profile"
      role = aws_iam_role.servers_iam_role.name
}

resource "aws_iam_instance_profile" "servers-a_iam_role_instance_profile" {
      name = "servers-a_iam_role_instance_profile"
      role = aws_iam_role.servers-a_iam_role.name
}

resource "aws_iam_instance_profile" "servers-b_iam_role_instance_profile" {
      name = "servers-b_iam_role_instance_profile"
      role = aws_iam_role.servers-b_iam_role.name
}

resource "aws_iam_instance_profile" "servers-c_iam_role_instance_profile" {
      name = "servers-c_iam_role_instance_profile"
      role = aws_iam_role.servers-c_iam_role.name
}

resource "aws_iam_role" "servers_iam_role" {
      name = "servers_iam_role"
      assume_role_policy = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Action\": \"sts:AssumeRole\",\n      \"Principal\": {\n        \"Service\": \"ec2.amazonaws.com\"\n      },\n      \"Effect\": \"Allow\",\n      \"Sid\": \"\"\n    }\n  ]\n}"
}

resource "aws_iam_role" "servers-a_iam_role" {
      name = "servers-a_iam_role"
      assume_role_policy = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Action\": \"sts:AssumeRole\",\n      \"Principal\": {\n        \"Service\": \"ec2.amazonaws.com\"\n      },\n      \"Effect\": \"Allow\",\n      \"Sid\": \"\"\n    }\n  ]\n}"
}

resource "aws_iam_role" "servers-b_iam_role" {
      name = "servers-b_iam_role"
      assume_role_policy = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Action\": \"sts:AssumeRole\",\n      \"Principal\": {\n        \"Service\": \"ec2.amazonaws.com\"\n      },\n      \"Effect\": \"Allow\",\n      \"Sid\": \"\"\n    }\n  ]\n}"
}

resource "aws_iam_role" "servers-c_iam_role" {
      name = "servers-c_iam_role"
      assume_role_policy = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Action\": \"sts:AssumeRole\",\n      \"Principal\": {\n        \"Service\": \"ec2.amazonaws.com\"\n      },\n      \"Effect\": \"Allow\",\n      \"Sid\": \"\"\n    }\n  ]\n}"
}

resource "aws_iam_role_policy_attachment" "servers_iam_role_devxp-class-storage_iam_policy0_attachment" {
      policy_arn = aws_iam_policy.devxp-class-storage_iam_policy0.arn
      role = aws_iam_role.servers_iam_role.name
}

resource "aws_iam_role_policy_attachment" "servers-a_iam_role_devxp-class-storage_iam_policy0_attachment" {
      policy_arn = aws_iam_policy.devxp-class-storage_iam_policy0.arn
      role = aws_iam_role.servers-a_iam_role.name
}

resource "aws_iam_role_policy_attachment" "servers-b_iam_role_devxp-class-storage_iam_policy0_attachment" {
      policy_arn = aws_iam_policy.devxp-class-storage_iam_policy0.arn
      role = aws_iam_role.servers-b_iam_role.name
}

resource "aws_iam_role_policy_attachment" "servers-c_iam_role_devxp-class-storage_iam_policy0_attachment" {
      policy_arn = aws_iam_policy.devxp-class-storage_iam_policy0.arn
      role = aws_iam_role.servers-c_iam_role.name
}

resource "aws_iam_role_policy_attachment" "servers_iam_role_devxp-class-storage-a_iam_policy0_attachment" {
      policy_arn = aws_iam_policy.devxp-class-storage-a_iam_policy0.arn
      role = aws_iam_role.servers_iam_role.name
}

resource "aws_iam_role_policy_attachment" "servers-a_iam_role_devxp-class-storage-a_iam_policy0_attachment" {
      policy_arn = aws_iam_policy.devxp-class-storage-a_iam_policy0.arn
      role = aws_iam_role.servers-a_iam_role.name
}

resource "aws_iam_role_policy_attachment" "servers-b_iam_role_devxp-class-storage-a_iam_policy0_attachment" {
      policy_arn = aws_iam_policy.devxp-class-storage-a_iam_policy0.arn
      role = aws_iam_role.servers-b_iam_role.name
}

resource "aws_iam_role_policy_attachment" "servers-c_iam_role_devxp-class-storage-a_iam_policy0_attachment" {
      policy_arn = aws_iam_policy.devxp-class-storage-a_iam_policy0.arn
      role = aws_iam_role.servers-c_iam_role.name
}

resource "aws_iam_role_policy_attachment" "servers_iam_role_database_iam_policy0_attachment" {
      policy_arn = aws_iam_policy.database_iam_policy0.arn
      role = aws_iam_role.servers_iam_role.name
}

resource "aws_iam_role_policy_attachment" "servers-a_iam_role_database_iam_policy0_attachment" {
      policy_arn = aws_iam_policy.database_iam_policy0.arn
      role = aws_iam_role.servers-a_iam_role.name
}

resource "aws_iam_role_policy_attachment" "servers-b_iam_role_database_iam_policy0_attachment" {
      policy_arn = aws_iam_policy.database_iam_policy0.arn
      role = aws_iam_role.servers-b_iam_role.name
}

resource "aws_iam_role_policy_attachment" "servers-c_iam_role_database_iam_policy0_attachment" {
      policy_arn = aws_iam_policy.database_iam_policy0.arn
      role = aws_iam_role.servers-c_iam_role.name
}

resource "aws_subnet" "devxp_vpc_subnet_public0" {
      vpc_id = aws_vpc.devxp_vpc.id
      cidr_block = "10.0.0.0/25"
      map_public_ip_on_launch = true
      availability_zone = "us-west-2a"
}

resource "aws_subnet" "devxp_vpc_subnet_public1" {
      vpc_id = aws_vpc.devxp_vpc.id
      cidr_block = "10.0.128.0/25"
      map_public_ip_on_launch = true
      availability_zone = "us-west-2b"
}

resource "aws_internet_gateway" "devxp_vpc_internetgateway" {
      vpc_id = aws_vpc.devxp_vpc.id
}

resource "aws_route_table" "devxp_vpc_routetable_pub" {
      route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.devxp_vpc_internetgateway.id
      }
      vpc_id = aws_vpc.devxp_vpc.id
}

resource "aws_route" "devxp_vpc_internet_route" {
      route_table_id = aws_route_table.devxp_vpc_routetable_pub.id
      destination_cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.devxp_vpc_internetgateway.id
}

resource "aws_route_table_association" "devxp_vpc_subnet_public_assoc" {
      subnet_id = aws_subnet.devxp_vpc_subnet_public0.id
      route_table_id = aws_route_table.devxp_vpc_routetable_pub.id
}

resource "aws_vpc" "devxp_vpc" {
      cidr_block = "10.0.0.0/16"
      enable_dns_support = true
      enable_dns_hostnames = true
}

resource "aws_security_group" "devxp_security_group" {
      vpc_id = aws_vpc.devxp_vpc.id
      name = "devxp_security_group"
      ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
      ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
      ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
      egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
      egress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
}

data "aws_iam_policy_document" "servers_iam_policy_document" {
      statement {
        actions = ["ec2:RunInstances", "ec2:AssociateIamInstanceProfile", "ec2:ReplaceIamInstanceProfileAssociation"]
        effect = "Allow"
        resources = ["arn:aws:ec2:::*"]
      }
      statement {
        actions = ["iam:PassRole"]
        effect = "Allow"
        resources = [aws_instance.servers.arn]
      }
}

data "aws_ami" "amazon_latest" {
      most_recent = true
      owners = ["585441382316"]
      filter {
        name = "name"
        values = ["*AmazonLinux*"]
      }
      filter {
        name = "virtualization-type"
        values = ["hvm"]
      }
}

data "aws_iam_policy_document" "servers-a_iam_policy_document" {
      statement {
        actions = ["ec2:RunInstances", "ec2:AssociateIamInstanceProfile", "ec2:ReplaceIamInstanceProfileAssociation"]
        effect = "Allow"
        resources = ["arn:aws:ec2:::*"]
      }
      statement {
        actions = ["iam:PassRole"]
        effect = "Allow"
        resources = [aws_instance.servers-a.arn]
      }
}

data "aws_iam_policy_document" "servers-b_iam_policy_document" {
      statement {
        actions = ["ec2:RunInstances", "ec2:AssociateIamInstanceProfile", "ec2:ReplaceIamInstanceProfileAssociation"]
        effect = "Allow"
        resources = ["arn:aws:ec2:::*"]
      }
      statement {
        actions = ["iam:PassRole"]
        effect = "Allow"
        resources = [aws_instance.servers-b.arn]
      }
}

data "aws_iam_policy_document" "servers-c_iam_policy_document" {
      statement {
        actions = ["ec2:RunInstances", "ec2:AssociateIamInstanceProfile", "ec2:ReplaceIamInstanceProfileAssociation"]
        effect = "Allow"
        resources = ["arn:aws:ec2:::*"]
      }
      statement {
        actions = ["iam:PassRole"]
        effect = "Allow"
        resources = [aws_instance.servers-c.arn]
      }
}

data "aws_iam_policy_document" "devxp-class-storage_iam_policy_document" {
      statement {
        actions = ["s3:ListAllMyBuckets"]
        effect = "Allow"
        resources = ["arn:aws:s3:::*"]
      }
      statement {
        actions = ["s3:*"]
        effect = "Allow"
        resources = [aws_s3_bucket.devxp-class-storage.arn]
      }
}

data "aws_iam_policy_document" "devxp-class-storage-a_iam_policy_document" {
      statement {
        actions = ["s3:ListAllMyBuckets"]
        effect = "Allow"
        resources = ["arn:aws:s3:::*"]
      }
      statement {
        actions = ["s3:*"]
        effect = "Allow"
        resources = [aws_s3_bucket.devxp-class-storage-a.arn]
      }
}

data "aws_iam_policy_document" "database_iam_policy_document" {
      statement {
        actions = ["dynamodb:DescribeTable", "dynamodb:Query", "dynamodb:Scan", "dynamodb:BatchGet*", "dynamodb:DescribeStream", "dynamodb:DescribeTable", "dynamodb:Get*", "dynamodb:Query", "dynamodb:Scan", "dynamodb:BatchWrite*", "dynamodb:CreateTable", "dynamodb:Delete*", "dynamodb:Update*", "dynamodb:PutItem"]
        effect = "Allow"
        resources = [aws_dynamodb_table.database.arn]
      }
      statement {
        actions = ["dynamodb:List*", "dynamodb:DescribeReservedCapacity*", "dynamodb:DescribeLimits", "dynamodb:DescribeTimeToLive"]
        effect = "Allow"
        resources = ["*"]
      }
}

