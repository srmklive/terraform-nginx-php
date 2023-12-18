# Terraform -Implement Application Load Balancer with Auto Scaling Group & EC2

## Introduction

This repo implements the provisions the following infrastructure on the AWS:

* CodeBuild.
* CodePipeline.
* IAM Roles.
* IAM Policies for CodeBuild & CodePipelines.
* S3 bucket to save build artifacts.


## Pre Requisites

You must have the following programs installed & configured properly on your machine:

* Terraform.
* AWS CLI.

## Installation

Clone the repo using the following:

```
# Using HTTPS

git clone https://github.com/srmklive/terraform-nginx-php.git

# Using SSH
git clone git@github.com:srmklive/terraform-nginx-php.git

```

## Configuring the code

> [!IMPORTANT]
> You should also rename the infrastructure being provisioned as per your liking.


### Running the code

```
terraform init
```

```
terraform plan -out="tf.plan"
```

```
terraform apply "tf.plan"
```