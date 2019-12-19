#!/bin/sh

set -eu

script_dir="$(cd "$(dirname "$0")"; pwd -P)"

kubectl apply -f "${script_dir}/nginx-statefulset.yml"

