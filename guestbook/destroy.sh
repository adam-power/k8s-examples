#!/bin/sh

set -eu

script_dir="$(cd "$(dirname "$0")"; pwd -P)"

kubectl delete -f "${script_dir}/redis-master.yml"
kubectl delete -f "${script_dir}/redis-slave.yml"
kubectl delete -f "${script_dir}/frontend.yml"

