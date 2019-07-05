#!/bin/sh

set -eu

script_dir="$(cd "$(dirname "$0")"; pwd -P)"

kubectl delete -f "${script_dir}/mysql-deployment.yml"
kubectl delete -f "${script_dir}/wordpress-deployment.yml"
kubectl delete secret/mysql-pass
