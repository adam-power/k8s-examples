#!/bin/sh

set -eu

script_dir="$(cd "$(dirname "$0")"; pwd -P)"

kubectl apply -f "${script_dir}/prometheus-configmap-basic.yml"
kubectl apply -f "${script_dir}/prometheus-deployment.yml"
