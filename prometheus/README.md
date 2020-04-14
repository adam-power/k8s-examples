# Prometheus testing

A test deployment of Prometheus to monitor your cluster.

To deploy, run the following:

```bash
./create.sh
```

To get your LoadBalancer's DNS name, run the following `kubectl` command
(note: the load balancer might take several minutes to become available):

```bash
# On AWS
kubectl get svc/prometheus -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'

# On GCP
kubectl get svc/prometheus -o jsonpath='{.status.loadBalancer.ingress[0].ip}'
```

To clean up, run the following:

```bash
./destroy.sh
```
