#!/bin/sh

set -eu

script_dir="$(cd "$(dirname "$0")"; pwd -P)"

kubectl delete --ignore-not-found -f "${script_dir}/nginx-deployment.yml"
kubectl delete --ignore-not-found -f "${script_dir}/ingress.yml"

