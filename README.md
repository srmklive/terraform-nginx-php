# Terraform -Create AWS EC2 instance with Nginx & PHP 8.2 

## Introduction

This repo implements the provisions the following infrastructure on the AWS:

* AWS EC2 instance with the following specs:
  * Ubuntu 22.04.
  * Nginx.
  * PHP 8.2
* 1 VPC.
* 1 Security Group.
* 1 Subnet.
* 1 Internet Gateway.


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