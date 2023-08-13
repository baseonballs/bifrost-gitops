# DeployKF Framework

A tool for bootstrapping the entiure kubeflow ecosystem onto a kubernestes cluster.

@source: https://www.deploykf.org/

# Synchronizing kf apps


# Using argocd sync

## log into argocd

1. argopw
2. argocd login $ARGO_HOST:$ARGO_PORT --insecure
3. hit , y to insecure access to https://$ARGO_HOST:$ARGO_PORT, enter admin & admin's password [from argopw]

# to list the app associated with app.kubernetes.io/component use:.e.g., argocd app list -l "app.kubernetes.io/component=deploykf-core"

[Ordered Dependencies]
argocd app set "argocd/asgard-deploykf" --sync-policy automated --auto-prune --self-heal
argocd app sync -l "app.kubernetes.io/component=deploykf-dependencies"
  argocd app set "argocd/dkf-dep--cert-manager" --sync-policy automated --auto-prune --self-heal
  argocd app set "argocd/dkf-dep--istio" --sync-policy automated --auto-prune --self-heal
  argocd app set "argocd/dkf-dep--kyverno" --sync-policy automated --auto-prune --self-heal
argocd app sync -l "app.kubernetes.io/component=deploykf-core"
  argocd app set "argocd/dkf-core--deploykf-auth" --sync-policy automated --auto-prune --self-heal
  argocd app set "argocd/dkf-core--deploykf-dashboard" --sync-policy automated --auto-prune --self-heal
  argocd app set "argocd/dkf-core--deploykf-istio-gateway" --sync-policy automated --auto-prune --self-heal
  argocd app set "argocd/dkf-core--deploykf-profiles-generator" --sync-policy automated --auto-prune --self-heal
argocd app sync -l "app.kubernetes.io/component=deploykf-opt"
  argocd app set "argocd/dkf-opt--deploykf-minio" --sync-policy automated --auto-prune --self-heal
  argocd app set "argocd/dkf-opt--deploykf-mysql" --sync-policy automated --auto-prune --self-heal
argocd app sync -l "app.kubernetes.io/component=deploykf-tools"
argocd app sync -l "app.kubernetes.io/component=kubeflow-dependencies"
  argocd app set "argocd/kf-dep--argo-workflows" --sync-policy automated --auto-prune --self-heal
argocd app sync -l "app.kubernetes.io/component=kubeflow-tools"
  argocd app set "argocd/kf-tools--katib" --sync-policy automated --auto-prune --self-heal
  argocd app set "argocd/kf-tools--notebooks--jupyter-web-app" --sync-policy automated --auto-prune --self-heal
  argocd app set "argocd/kf-tools--notebooks--notebook-controller" --sync-policy automated --auto-prune --self-heal
  argocd app set "argocd/kf-tools--pipelines" --sync-policy automated --auto-prune --self-heal
  argocd app set "argocd/kf-tools--poddefaults-webhook" --sync-policy automated --auto-prune --self-heal
  argocd app set "argocd/kf-tools--tensorboards--tensorboard-controller" --sync-policy automated --auto-prune --self-heal
  argocd app set "argocd/kf-tools--tensorboards--tensorboards-web-app" --sync-policy automated --auto-prune --self-heal
  argocd app set "argocd/kf-tools--training-operator" --sync-policy automated --auto-prune --self-heal
  argocd app set "argocd/kf-tools--volumes--volumes-web-app" --sync-policy automated --auto-prune --self-heal

## set auto sync policy

argocd app set "argocd/asgard-deploykf" --sync-policy automated --auto-prune --self-heal
argicd app set [by label doesn't work]
[hack]

## Schedule sync request via argocd using group labels assignedd as app.kubernetes.io/component

argocd app list "argocd/asgard-deploykf"
argocd app list -l "app.kubernetes.io/component=deploykf-dependencies"
argocd app list -l "app.kubernetes.io/component=deploykf-core"
argocd app list -l "app.kubernetes.io/component=deploykf-opt"
argocd app list -l "app.kubernetes.io/component=deploykf-tools"
argocd app list -l "app.kubernetes.io/component=kubeflow-dependencies"
argocd app list -l "app.kubernetes.io/component=kubeflow-tools"


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