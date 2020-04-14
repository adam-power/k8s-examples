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

## Namespace handling

Some of these configs have the `default` namespace hardcoded in them.
If you're not in `default`, make sure you change the configs first.

## How to update the Prometheus config

You can update Prometheus with one of the other example configs, or create your own.
Just run the following commands to create a new ConfigMap, and refresh Prometheus:

```bash
kubectl apply -f <prometheus configmap yml>
kubectl delete pods -l app=prometheus
```

## List of Prometheus configs

| Config file | Description |
|---|---|
| [basic](./prometheus-configmap-basic.yml) | A hello-world config.  The Prometheus Pod only monitors itself. |
| [internal k8s](./prometheus-configmap-internal-k8s.yml) | Prometheus monitors the Kubernetes cluster into which it has been deployed. Authentication is handled using internal k8s objects, such as services and service account tokens. |
