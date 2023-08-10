# DeployKF Framework

A tool for bootstrapping the entiure kubeflow ecosystem onto a kubernestes cluster.

@source: https://www.deploykf.org/

# Synchronizing kf apps


# Using argocd sync


argocd app sync "mlops-app-of-apps"
argocd app sync -l "app.kubernetes.io/component=deploykf-dependencies"
argocd app sync -l "app.kubernetes.io/component=deploykf-core"
argocd app sync -l "app.kubernetes.io/component=deploykf-opt"
argocd app sync -l "app.kubernetes.io/component=deploykf-tools"
argocd app sync -l "app.kubernetes.io/component=kubeflow-dependencies"
argocd app sync -l "app.kubernetes.io/component=kubeflow-tools"


# once the apps are synced and fully deployed; proceed to port foward teh deploykf-gateway.

# host definition should be updated in /etc/hosts

```sh
127.0.0.1 deploykf.example.com
127.0.0.1 argo-server.deploykf.example.com
127.0.0.1 minio-api.deploykf.example.com
127.0.0.1 minio-console.deploykf.example.com
```

```sh
kubectl port-forward \
  --namespace "deploykf-istio-gateway" \
  svc/deploykf-gateway 8080:http 8443:https
```

@source: https://www.deploykf.org/guides/getting-started/

You should now see the deployKF dashboard at https://deploykf.example.com:8443/, where you can use one of the following credentials (if you have not changed them):

User	Username	Password
Admin (Profile Owner)	admin@example.com	admin
User 1	user1@example.com	user1
User 2	user2@example.com	user2