# Kubernetes examples

A collection of examples and test apps that can be used to validate a Kubernetes cluster

## Storage Classes

Storage classes by IaaS:

+ [vSphere](./storageclass/vsphere.yml)
+ [AWS](./storageclass/aws.yml)

## Sample apps

**Note:** These all require that your cluster has `LoadBalancer` services working.

| App | Description |
|---|---|
| [guestbook](./guestbook/) | A simple Redis backend and PHP frontend. |
| [wordpress](./wordpress/) | A simple Redis backend and PHP frontend. |
| [nginx](./nginx/) | A sample NGINX app with optional Ingress add-on. |

## Prometheus examples

The [prometheus](./prometheus/) folder contains a minimal Prometheus deployment, as well as example configs.

## NetworkPolicy example

The [networkpolicy](./networkpolicy/) folder contains an example that can be used to test whether a k8s cluster is
enforcing NetworkPolicies.

## Utilities

To start a test pod and attach to it, run the `test_pod.sh` script:

```bash
# Run and attach to a test pod in the default namespace
./util/test_pod.sh <docker image name>

# Run and attach to a test pod in a namespace that you specify
./util/test_pod.sh <docker image name> <namespace>
```

Common images you may want to use include [ubuntu](https://hub.docker.com/_/ubuntu) and [busybox](https://hub.docker.com/_/busybox).
