# Description

This repository has a example for templates in cloudformation for started proyect in AWS. The layers in this repository are:
- Instances
- Networking
- Monitoring

## Networking
This template is the principal for started on networking on aws. Please select natgateway if you need or not. Remember modify the SG and ACL

## Instances
If you want 3 instances, please deploy 3 stacks from the same template.

## Instances
If you want 3 instances, please deploy 3 stacks from the same template.

## Monitoring
If you want alerts by email or sns, you can use this templates for beginning start

## Before starting
Must have installed AWS CLI and SAM. Before install AWS CLI configure the AWS CLI to execute the commands in your AWS account.

### Installing AWS CLI & SAM
- [AWS CLI Installer](https://docs.aws.amazon.com/es_es/cli/latest/userguide/cli-chap-install.html)
- [SAM Installer](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html)


```diff
+ I like to use SAM, but you could use the AWS CLI directly with cloudformation
```

# Usage
You can either implement the tamplate with your favorite SAM command, or run the **deploy.sh** file. Note that you should replace the variables within the file.