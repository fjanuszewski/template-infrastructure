# Description

This repository has a backend implemented in AWS cloudformation. In the template.yaml file you will find the following resources:
- VPC: The CIDR Block by default is **172.0.0.0/16**
- Subnet Public x2:  Subnet with RT and roule to IGW
- Subnet Proceted x2: Subnet with RT and roule to NatGW (Not Enabled)
- Subnet Private x2: Subnet without internet
- Internet Gateway (IGW): Only for public subnets
- Security Groups & ACLs

## Before starting
Must have installed AWS CLI and SAM. After install AWS CLI configure the AWS CLI to execute the commands in your AWS account.

```diff
+ I like to use SAM, but you could use the AWS CLI directly with cloudformation
```

### Installing AWS CLI & SAM
- [AWS CLI Installer](https://docs.aws.amazon.com/es_es/cli/latest/userguide/cli-chap-install.html)
- [SAM Installer](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html)

# Usage
You can either implement the tamplate with your favorite SAM command, or run the **deploy.sh** file. Note that you should replace the variables within the file.

### Environments
- **ENV**: This work fine if we use SAM in local. In Pipeline is not needed
- **BUCKET**: Bucket is required for [SAM Package](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/sam-cli-command-reference-sam-package.html)
- **STACK**: Name of stack in CloudFormation, is reference for the name of objects in template
- **PROJECT**: Tag for all resources
- **CUSTOMER**: Required for descriptions
- **AWS_PROFILE**: recommended
- **REGION**: recommended

