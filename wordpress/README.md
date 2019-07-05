# Wordpress sample app

Code is mostly borrowed from the Kubernetes docs [Wordpress sample app](https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/).
This is a basic Wordpress installation with a persistent MySQL backend.
The app uses PersistentVolumeClaims (PVCs), as well as a LoadBalancer service.

As a pre-requisite, your cluster must have a default StorageClass configured.
You can find StorageClass templates for various IaaSes in the [storageclass](../storageclass/) folder.
Choose your IaaS, then run `kubectl apply`.

To deploy, run the following:

```bash
./create.sh
```

To get your LoadBalancer's DNS name, run the following `kubectl` command
(note: the load balancer might take several minutes to become available):

```bash
kubectl get svc/wordpress -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'
```

A password is randomly generated for MySQL.
If you want to see the password, you can run the following command:

```bash
kubectl get secret/mysql-pass -o jsonpath='{.data.password}' | base64 --decode
```

Your app should be persistent.
You can try logging in to Wordpress, editing the default page, then deleting your pods.
The webpage and your settings should still be there after the pods are re-created.

```bash
kubectl delete pods -l app=wordpress
```

To clean up, run the following:

```bash
./destroy.sh
```
