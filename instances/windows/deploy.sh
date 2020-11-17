#!/bin/bash
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
#VARIABLES ESTANDAR
SOURCE="$(pwd)"

ENVIRONMENT=production
CUSTOMER=violetta

PROJECT=$CUSTOMER-poc
BUCKET=$PROJECT-sam

STACK=$PROJECT-instances

AWS_PROFILE=droptek_prod_new
REGION="us-east-2"


SUBNETID="subnet-056f0599f8841f139"
SECURITYGROUPNAME="sg-04bdfe9381083930f"
KEYNAME="webserver-violetta-poc"
INSTANCETYPE="c5.xlarge"
AMI="ami-03657b56516ab7912"
EBS=50

echo "${YELLOW} Creating Bucket..."
echo " ================================${NC}"
aws s3api create-bucket --bucket $BUCKET --region $REGION --profile $AWS_PROFILE --create-bucket-configuration LocationConstraint=$REGION

echo "${YELLOW} Validating local SAM Template..."
echo " ================================${NC}"
sam validate --profile $AWS_PROFILE --template "template.yaml"

echo "${YELLOW} Building local SAM App..."
echo " =========================${NC}"
sam build --profile $AWS_PROFILE -t "template.yaml"

echo "${YELLOW} Package"
echo " ================================================= ${NC}"
sam package --profile $AWS_PROFILE --template-file .aws-sam/build/template.yaml --output-template-file .aws-sam/build/packaged-template.yaml --s3-bucket $BUCKET

echo -e "${YELLOW} Building SAM  cloudformation..."
echo -e " =============================== ${NC}"
sam deploy --region $REGION --profile $AWS_PROFILE --template-file .aws-sam/build/packaged-template.yaml --stack-name $STACK --tags Project=$PROJECT Environment=$ENVIRONMENT --parameter-overrides PublicSubnet=$SUBNETID WebSecurityGroup=$SECURITYGROUPNAME KeyName=$KEYNAME Customer=$CUSTOMER InstanceType=$INSTANCETYPE ami=$AMI Project=$PROJECT EBS=$EBS --capabilities CAPABILITY_NAMED_IAM
