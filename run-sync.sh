#!/bin/sh

set -e

if [ -z "$AWS_REGION" ]; then
  printf "Please set AWS_REGION."
  exit 1
fi

if [ -z "$AWS_ACCESS_KEY_ID" ] || [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
  printf "Please set both AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY."
  exit 1
fi

if [ -z "$AWS_S3_BUCKET" ]; then
  printf "Please set AWS_S3_BUCKET."
  exit 1
fi

aws s3 sync ${SOURCE_PATH:-.} s3://${AWS_S3_BUCKET}/${DESTINATION_PATH} --no-progress --only-show-errors $*
