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
      bucket = "terraform-state-m5rufcnl3voaaajnin6vut0gykxiuzad0m48eha8qxp8d"
}

resource "aws_instance" "Instance-zouj" {
      ami = data.aws_ami.amazon_latest.id
      instance_type = "t2.micro"
      lifecycle {
        ignore_changes = [ami]
      }
      subnet_id = aws_subnet.devxp_vpc_subnet_public0.id
      associate_public_ip_address = true
      vpc_security_group_ids = [aws_security_group.devxp_security_group.id]
      iam_instance_profile = aws_iam_instance_profile.Instance-zouj_iam_role_instance_profile.name
}

resource "aws_eip" "Instance-zouj_eip" {
      vpc = true
      instance = aws_instance.Instance-zouj.id
}

resource "aws_iam_user" "Instance-zouj_iam" {
      name = "Instance-zouj_iam"
}

resource "aws_iam_user_policy_attachment" "Instance-zouj_iam_policy_attachment0" {
      user = aws_iam_user.Instance-zouj_iam.name
      policy_arn = aws_iam_policy.Instance-zouj_iam_policy0.arn
}

resource "aws_iam_policy" "Instance-zouj_iam_policy0" {
      name = "Instance-zouj_iam_policy0"
      path = "/"
      policy = data.aws_iam_policy_document.Instance-zouj_iam_policy_document.json
}

resource "aws_iam_access_key" "Instance-zouj_iam_access_key" {
      user = aws_iam_user.Instance-zouj_iam.name
}

resource "aws_s3_bucket" "bucket-ogys-qizw-bmzm-bbcb-ovxp" {
      bucket = "bucket-ogys-qizw-bmzm-bbcb-ovxp"
}

resource "aws_s3_bucket_public_access_block" "bucket-ogys-qizw-bmzm-bbcb-ovxp_access" {
      bucket = aws_s3_bucket.bucket-ogys-qizw-bmzm-bbcb-ovxp.id
      block_public_acls = true
      block_public_policy = true
}

resource "aws_iam_user" "bucket-ogys-qizw-bmzm-bbcb-ovxp_iam" {
      name = "bucket-ogys-qizw-bmzm-bbcb-ovxp_iam"
}

resource "aws_iam_user_policy_attachment" "bucket-ogys-qizw-bmzm-bbcb-ovxp_iam_policy_attachment0" {
      user = aws_iam_user.bucket-ogys-qizw-bmzm-bbcb-ovxp_iam.name
      policy_arn = aws_iam_policy.bucket-ogys-qizw-bmzm-bbcb-ovxp_iam_policy0.arn
}

resource "aws_iam_policy" "bucket-ogys-qizw-bmzm-bbcb-ovxp_iam_policy0" {
      name = "bucket-ogys-qizw-bmzm-bbcb-ovxp_iam_policy0"
      path = "/"
      policy = data.aws_iam_policy_document.bucket-ogys-qizw-bmzm-bbcb-ovxp_iam_policy_document.json
}

resource "aws_iam_access_key" "bucket-ogys-qizw-bmzm-bbcb-ovxp_iam_access_key" {
      user = aws_iam_user.bucket-ogys-qizw-bmzm-bbcb-ovxp_iam.name
}

resource "aws_dynamodb_table" "DynamoDb-avxi" {
      name = "DynamoDb-avxi"
      hash_key = "String"
      billing_mode = "PAY_PER_REQUEST"
      ttl {
        attribute_name = "TimeToExist"
        enabled = true
      }
      attribute {
        name = "String"
        type = "S"
      }
}

resource "aws_iam_user" "DynamoDb-avxi_iam" {
      name = "DynamoDb-avxi_iam"
}

resource "aws_iam_user_policy_attachment" "DynamoDb-avxi_iam_policy_attachment0" {
      user = aws_iam_user.DynamoDb-avxi_iam.name
      policy_arn = aws_iam_policy.DynamoDb-avxi_iam_policy0.arn
}

resource "aws_iam_policy" "DynamoDb-avxi_iam_policy0" {
      name = "DynamoDb-avxi_iam_policy0"
      path = "/"
      policy = data.aws_iam_policy_document.DynamoDb-avxi_iam_policy_document.json
}

resource "aws_iam_access_key" "DynamoDb-avxi_iam_access_key" {
      user = aws_iam_user.DynamoDb-avxi_iam.name
}

resource "aws_iam_instance_profile" "Instance-zouj_iam_role_instance_profile" {
      name = "Instance-zouj_iam_role_instance_profile"
      role = aws_iam_role.Instance-zouj_iam_role.name
}

resource "aws_iam_role" "Instance-zouj_iam_role" {
      name = "Instance-zouj_iam_role"
      assume_role_policy = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Action\": \"sts:AssumeRole\",\n      \"Principal\": {\n        \"Service\": \"ec2.amazonaws.com\"\n      },\n      \"Effect\": \"Allow\",\n      \"Sid\": \"\"\n    }\n  ]\n}"
}

resource "aws_iam_role_policy_attachment" "Instance-zouj_iam_role_bucket-ogys-qizw-bmzm-bbcb-ovxp_iam_policy0_attachment" {
      policy_arn = aws_iam_policy.bucket-ogys-qizw-bmzm-bbcb-ovxp_iam_policy0.arn
      role = aws_iam_role.Instance-zouj_iam_role.name
}

resource "aws_iam_role_policy_attachment" "Instance-zouj_iam_role_DynamoDb-avxi_iam_policy0_attachment" {
      policy_arn = aws_iam_policy.DynamoDb-avxi_iam_policy0.arn
      role = aws_iam_role.Instance-zouj_iam_role.name
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
      ingress = []
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

data "aws_iam_policy_document" "Instance-zouj_iam_policy_document" {
      statement {
        actions = ["ec2:RunInstances", "ec2:AssociateIamInstanceProfile", "ec2:ReplaceIamInstanceProfileAssociation"]
        effect = "Allow"
        resources = ["arn:aws:ec2:::*"]
      }
      statement {
        actions = ["iam:PassRole"]
        effect = "Allow"
        resources = [aws_instance.Instance-zouj.arn]
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

data "aws_iam_policy_document" "bucket-ogys-qizw-bmzm-bbcb-ovxp_iam_policy_document" {
      statement {
        actions = ["s3:ListAllMyBuckets"]
        effect = "Allow"
        resources = ["arn:aws:s3:::*"]
      }
      statement {
        actions = ["s3:*"]
        effect = "Allow"
        resources = [aws_s3_bucket.bucket-ogys-qizw-bmzm-bbcb-ovxp.arn]
      }
}

data "aws_iam_policy_document" "DynamoDb-avxi_iam_policy_document" {
      statement {
        actions = ["dynamodb:DescribeTable", "dynamodb:Query", "dynamodb:Scan", "dynamodb:BatchGet*", "dynamodb:DescribeStream", "dynamodb:DescribeTable", "dynamodb:Get*", "dynamodb:Query", "dynamodb:Scan", "dynamodb:BatchWrite*", "dynamodb:CreateTable", "dynamodb:Delete*", "dynamodb:Update*", "dynamodb:PutItem"]
        effect = "Allow"
        resources = [aws_dynamodb_table.DynamoDb-avxi.arn]
      }
      statement {
        actions = ["dynamodb:List*", "dynamodb:DescribeReservedCapacity*", "dynamodb:DescribeLimits", "dynamodb:DescribeTimeToLive"]
        effect = "Allow"
        resources = ["*"]
      }
}


