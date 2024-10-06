#!/bin/bash
set -x
set -e
set -o pipefail
echo "Date of the day: " >> /home/user/Documents/Project1/output.txt
date >> /home/user/Documents/Project1/output.txt
echo "Details of S3 buckets created: " >> /home/user/Documents/Project1/output.txt
aws s3 ls >> /home/user/Documents/Project1/output.txt
echo "Details of EC2 instances created: " >> /home/user/Documents/Project1/output.txt
aws ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId, KeyName, LaunchTime, State.Name]" --output table >> /home/user/Documents/Project1/output.txt
echo "Details of lambda functons created: " >> /home/user/Documents/Project1/output.txt
aws lambda list-functions >> /home/user/Documents/Project1/output.txt
echo "Details of iam users: " >> /home/user/Documents/Project1/output.txt
aws iam list-users >> /home/user/Documents/Project1/output.txt 
