provider "aws" {
  region                   = "us-east-2"  # Specifies the AWS region
  shared_credentials_files = ["~/.aws/credentials"]  # Specifies the location of the AWS shared credentials file
  profile                  = "tfuser"  # Specifies the AWS profile to use from the shared credentials file
}
