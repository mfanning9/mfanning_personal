provider "aws" {
  # Test keys for checkov testing checkov -d . --external-checks-dir ./checkov_custom_checks
  access_key = "AKIAIOSFODNN7EXAMPLE"
  secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
  region     = "us-east-1"

  # only required for non virtual hosted-style endpoint use case.
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs#s3_use_path_style
  s3_use_path_style           = false
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = false


    endpoints {
        apigateway     = "http://localhost:4566"
        apigatewayv2   = "http://localhost:4566"
        cloudformation = "http://localhost:4566"
        cloudwatch     = "http://localhost:4566"
        dynamodb       = "http://localhost:4566"
        ec2            = "http://localhost:4566"
        es             = "http://localhost:4566"
        elasticache    = "http://localhost:4566"
        firehose       = "http://localhost:4566"
        iam            = "http://localhost:4566"
        kinesis        = "http://localhost:4566"
        lambda         = "http://localhost:4566"
        rds            = "http://localhost:4566"
        redshift       = "http://localhost:4566"
        route53        = "http://localhost:4566"
        s3             = "http://s3.localhost.localstack.cloud:4566"
        secretsmanager = "http://localhost:4566"
        ses            = "http://localhost:4566"
        sns            = "http://localhost:4566"
        sqs            = "http://localhost:4566"
        ssm            = "http://localhost:4566"
        stepfunctions  = "http://localhost:4566"
        sts            = "http://localhost:4566"
    }
}

data "aws_caller_identity" "current" {}
output "is_localstack" {
  value = data.aws_caller_identity.current.id == "000000000000"
}

resource "aws_s3_bucket" "test-bucket" {
  bucket = "my-bucket"
    tags = { # checkov testing
    AccessKey = "AKIA1234567890EXAMPLE"
    OwnerEmail = "john.connor@gmail.com"

  }
}

/* tearing down resource for test, was able to ping pulbic ip of instance
resource "aws_instance" "ec2_testing" {
  ami           = "ami-12345678"
  instance_type = "t3.micro"

  tags = { # Checkov testing
    AccessKey = "AKIAIOSFODNN7EXAMPLE"
    SecretKey = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
    OwnerEmail = "john.connor@gmail.com"

  }
}
*/