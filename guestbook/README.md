# Guestbook sample app

Code is mostly borrowed from [the Kubernetes docs](https://kubernetes.io/docs/tutorials/stateless-application/guestbook/).
A `LoadBalancer` service has been added, as well as wrapper scripts.

To deploy, run the following:

```bash
./create.sh
```

To get your LoadBalancer's DNS name, run the following `kubectl` command
(note: the load balancer might take several minutes to become available):

```bash
kubectl get svc/frontend -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'
```

To clean up, run the following:

```bash
./destroy.sh
```
