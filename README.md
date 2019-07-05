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
