#!/bin/sh

set -eu

script_dir="$(cd "$(dirname "$0")"; pwd -P)"

kubectl apply -f "${script_dir}/redis-master.yml"
kubectl apply -f "${script_dir}/redis-slave.yml"
kubectl apply -f "${script_dir}/frontend.yml"

