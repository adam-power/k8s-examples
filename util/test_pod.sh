#!/bin/sh

set -euo pipefail

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
  echo "Usage: $0 <docker image name> <namespace (optional)>"
  exit 1
fi

test_image="$1"
namespace="${2:-""}"

if [ "$#" -eq 2 ]; then
  kubectl -n "$namespace" \
    run -it test-pod \
    --image="$test_image" \
    --generator=run-pod/v1 \
    --rm \
    --
else
  kubectl \
    run -it test-pod \
    --image="$test_image" \
    --generator=run-pod/v1 \
    --rm \
    --
fi
