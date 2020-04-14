# Prometheus testing

A test deployment of Prometheus to monitor your cluster.

## Pre-requisites for a PKS cluster

If testing this on PKS, your cluster must have the following settings enabled:

- Host monitoring:
  - Telegraf outputs should be enabled
  - All boxes under "Enable Telegraf Outputs" should be checked
  - You should have the following Telegraf configuration:

      ```toml
      # Publish all metrics to /metrics for Prometheus to scrape
      [[outputs.prometheus_client]]
        ## Address to listen on.
        listen = ":9273"
      ```

- In-cluster monitoring:
  - cAdvisor should be deployed
  - Metric Sinks should be enabled
  - Node Exporters on workers should be enabled

## Usage

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
| [bosh_exporter](./prometheus-configmap-bosh-exporter.yml) | Prometheus uses the `bosh_exporter` for service discovery. See below for how to deploy the `bosh_exporter` before using this `ConfigMap`. |

## How to deploy the bosh_exporter

First, create the secrets for `bosh_exporter`.
The instructions below assume that you have exported your BOSH variables using the `om bosh-env` command.
Check the [bosh_exporter Github page](https://github.com/bosh-prometheus/bosh_exporter) for a full list of available options.

```bash
kubectl create secret generic \
  bosh-exporter-env \
  --from-literal=BOSH_EXPORTER_BOSH_URL="$BOSH_ENVIRONMENT" \
  --from-literal=BOSH_EXPORTER_BOSH_UAA_CLIENT_ID="$BOSH_CLIENT" \
  --from-literal=BOSH_EXPORTER_BOSH_UAA_CLIENT_SECRET="$BOSH_CLIENT_SECRET" \
  --from-literal=BOSH_EXPORTER_BOSH_CA_CERT_FILE="/etc/bosh/ca.crt" \
  --from-literal=BOSH_EXPORTER_METRICS_ENVIRONMENT="test"

kubectl create secret generic \
  bosh-exporter-ca \
  --from-literal=ca.crt="$BOSH_CA_CERT"
```

Then, create the `bosh_exporter` deployment:

```bash
kubectl apply -f bosh-exporter-deployment.yml
```
