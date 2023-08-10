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
