# Description

This repository has a backend implemented in AWS cloudformation. In the template.yaml file you will find the following resources:
- EC2: EC2 WebServer
- EIP: EIP associated to EC2
- UserData: The user data is optional and this can be external
- LifecyclePolicy: This is used for scheduled backups

## LifeCyclePolicy (DLM)
This is required by customer, the time and retention can be changed in CloudFormation. If you dont need this, please remove for avoid charges

## ElasticIP (EIP)
This is required by customer. If you dont need this, please remove for avoid charges

## Contional EBS
This CloudFormation have a EBS conditional attached to the instance. Please read the CF after deploy for avoid charges

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

### Environments
- **ENVIRONMENT**: This work fine if we use SAM in local. In Pipeline is not needed
- **BUCKET**: Bucket is required for [SAM Package](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/sam-cli-command-reference-sam-package.html)
- **STACK**: Name of stack in CloudFormation, is reference for the name of objects in template
- **PROJECT**: Tag for all resources
- **CUSTOMER**: Required for descriptions
- **AWS_PROFILE**: recommended
- **REGION**: recommended
- **SUBNETID**: Subnet for EC2 (this project requires only 1 EC2 public. in other cases, this may be change)
- **SECURITYGROUPNAME**: SecurityGroup for EC2 (this project requires only 1 EC2 public. in other cases, this may be change)
- **KEYNAME**: KeyName for EC2 (this project requires only 1 EC2 public. in other cases, this may be change)
- **INSTANCETYPE**: InstanceType for EC2 (this project requires only 1 EC2 public. in other cases, this may be change)
- **AMI**: AMI for EC2 (this project requires only 1 EC2 public. in other cases, this may be change)

