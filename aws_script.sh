#!/bin/bash
set -e
echo "Listing EC2 Instances in region $AWS_DEFAULT_REGION ..."
aws ec2 describe-instances --region "$AWS_DEFAULT_REGION"

