#!/bin/sh

set -eu

script_dir="$(cd "$(dirname "$0")"; pwd -P)"

kubectl delete -f "${script_dir}/nginx-deployment.yml"

