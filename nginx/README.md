# nginx sample app

A sample stateless NGINX web app.
A `Deployment` is created to run the pods, as well as a `LoadBalancer` `Service` in front of the app.
The webapp will display some basic information from its environment.
If you curl the load balancer's IP, you should see from the hostname that you are hitting a different pod each time.
**Note:** If you go to the IP using a browser (such as Chrome), you may not get round-robbined between pods.

To deploy, run the following:

```bash
./create.sh
```

**Note:** If you are using RBAC on TKG, you will need to bind a
`ClusterRole` to your default serviceaccount so the Pod can be scheduled:

```bash
kubectl apply -f ../util/tkg-rbac.yml
```

To get your LoadBalancer's DNS name, run the following `kubectl` command
(note: the load balancer might take several minutes to become available):

```bash
# On AWS
kubectl get svc/nginx -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'

# On GCP
kubectl get svc/nginx -o jsonpath='{.status.loadBalancer.ingress[0].ip}'
```

If your cluster has an Ingress Controller set up, you can add an Ingress to this app.
You must first edit the `ingress.yml` file and replace the hostname placeholder with your
real ingress hostname for the app.
Then run the following command:

```bash
kubectl apply -f ingress.yml
```

To clean up, run the following:

```bash
./destroy.sh
```
