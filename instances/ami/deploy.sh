#!/bin/bash
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
#VARIABLES ESTANDAR
SOURCE="$(pwd)"

ENVIRONMENT=develop
CUSTOMER=XXXXX

PROJECT=$CUSTOMER
BUCKET=$PROJECT-sam

STACK=$PROJECT-XXXX-XXXX-instance

AWS_PROFILE=XXXXXX
REGION="us-east-2"


SUBNETID="sXXXXX"
SECURITYGROUPID="XXXXX"
KEYNAME="XXXX"
INSTANCETYPE="t3.small"
# EBS=50

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
sam deploy --region $REGION --profile $AWS_PROFILE --template-file .aws-sam/build/packaged-template.yaml --stack-name $STACK --tags Project=$PROJECT Environment=$ENVIRONMENT --parameter-overrides PublicSubnet=$SUBNETID Ec2SecurityGroup=$SECURITYGROUPID KeyName=$KEYNAME Customer=$CUSTOMER InstanceType=$INSTANCETYPE Project=$PROJECT --capabilities CAPABILITY_NAMED_IAM
