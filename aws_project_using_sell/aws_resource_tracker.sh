#!/bin/bash

###############
# Author: Maksym
# Date: 20.2.2026
# This scrip will show aws resourses usage
# You also need to configure AWS CLI
##############

# AWS S3
# AWS EC2
# AWS lambda
# AWS IAM Users

#set -x # debug

echo "Print list of s3 buckets:"
# List S3 buckets
aws s3 ls

echo "Print list of ec2:"
# List EC2 Instances
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

echo "Print lambda functions:"
# List AWS lambda
aws lambda list-functions

echo "Print IAM users:"
# List IAM users
aws iam list-users


