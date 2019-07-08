# Kubernetes examples

A collection of examples and test apps that can be used to validate a Kubernetes cluster

## Storage Classes

Storage classes by IaaS:

+ [vSphere](./storageclass/vsphere.yml)
+ [AWS](./storageclass/aws.yml)

## Sample apps

| App | Description |
|---|---|
| [guestbook](./guestbook/) | A simple Redis backend and PHP frontend.<br>Your cluster must have the ability to create `LoadBalancer` services. |
| [wordpress](./wordpress/) | A simple Redis backend and PHP frontend.<br>Your cluster must have the ability to create `LoadBalancer` services. |

## Utilities

To start a test pod and attach to it, run the `test_pod.sh` script:

```bash
# Run and attach to a test pod in the default namespace
./util/test_pod.sh <docker image name>

# Run and attach to a test pod in a namespace that you specify
./util/test_pod.sh <docker image name> <namespace>
```

Common images you may want to use include [ubuntu](https://hub.docker.com/_/ubuntu) and [busybox](https://hub.docker.com/_/busybox).
