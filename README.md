# Concepts of jdev-asgard-gitops

# Bootstrap registry of argcd-managed applications.

We use argcd to register applications (CRD) as defiend by AroCD. It allows us to use helm charts as the de factor installer for kubernetes based components and utilize the gitops infrastructure to manage and reconcile changes in the cluster.


## Administration with ArgoCD

1. argopw
2. argocd login $ARGO_HOST
3. hit , y to insecure access to https://$ARGO_HOST, enter admin & admin's password [from argopw]

# example of using argcd to create helm - app
argocd app create helm-guestbook --repo  https://github.com/argoproj/argocd-example-apps.git \
    --path helm-guestbook \
    --dest-server https://kubernetes.default.svc \
    --dest-namespace argohelmtest

# use argocd sync
argocd app sync "mlops-app-of-apps"
argocd app sync -l "app.kubernetes.io/component=deploykf-dependencies"
argocd app sync -l "app.kubernetes.io/component=deploykf-core"
argocd app sync -l "app.kubernetes.io/component=deploykf-opt"
argocd app sync -l "app.kubernetes.io/component=deploykf-tools"
argocd app sync -l "app.kubernetes.io/component=kubeflow-dependencies"
argocd app sync -l "app.kubernetes.io/component=kubeflow-tools"
