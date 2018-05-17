#!/bin/bash -eu

terraform plan -detailed-exitcode

plan_exit_code=$?

case $plan_exit_code in
  1)
    echo "INFO: Terraform infrastructure has not drifted"
    exit 0
    ;;
  2)
    echo "ERROR: Terraform plan has failed"
    exit 1
    ;;
  3)
    echo "ERROR: Terraform infrastructure has drifted"
    exit 2
    ;;
  *)
    echo "ERROR: Unexpected exit code: $plan_exit_code"
    exit 3
    ;;
esac

echo "ERROR: Exception caught, script $0 is misbehaving"
exit 4
