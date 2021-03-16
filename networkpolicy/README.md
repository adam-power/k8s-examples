# NetworkPolicy tutorial

A sample that can be used to test
[NetworkPolicy](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
configuration.

This example creates an nginx Pod and Service, and a NetworkPolicy that
prevents access to the Pod unless the client has the label `access="true"`.

To set up the example, run the following:

```bash
./create.sh
```

**Note:** If you are using RBAC on TKG, you will need to bind a
`ClusterRole` to your default serviceaccount so the Pod can be scheduled:

```bash
kubectl apply -f ../util/tkg-rbac.yml
```

First, verify that an ordinary Pod cannot access nginx:

```bash
# The following should produce the error 'download timed out'
kubectl run busybox --rm -ti --image=busybox -- wget --spider --timeout=15 nginx
```

Then, try to run the same command from a Pod that has the correct label:

```bash
# The following command should say 'remote file exists'
kubectl run busybox --rm -ti --labels="access=true" --image=busybox -- wget --spider --timeout=15 nginx
```

To clean up, run the following:

```bash
./destroy.sh
```
