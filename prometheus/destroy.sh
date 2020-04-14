#!/bin/sh

set -eu

script_dir="$(cd "$(dirname "$0")"; pwd -P)"

kubectl delete --ignore-not-found -f "${script_dir}/prometheus-deployment.yml"
kubectl delete --ignore-not-found -f "${script_dir}/prometheus-configmap-basic.yml"
kubectl delete --ignore-not-found -f "${script_dir}/bosh-exporter-deployment.yml"
kubectl delete --ignore-not-found secret bosh-exporter-env
kubectl delete --ignore-not-found secret bosh-exporter-ca
