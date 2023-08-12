
# Bifrost Infra Components

# The version of tools used for bifrost by way of manual package managers

## Example
KIND_VERSION=${KIND_VERSION:-v0.20.0}
# The version of kubectl; tied to the kubernetes release;
# semver: https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/README.md 
# old: v1.17.11

# old: v0.11.1 -> STABLE WITH ARGOCD
# smver: https://github.com/kubernetes-sigs/kind/releases 
# latest: 0.20.0, 0.19.0
KIND_VERSION=${KIND_VERSION:-v0.20.0}
# The version of kubectl; tied to the kubernetes release;
# semver: https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/README.md 
# old: v1.17.11
KUBECTL_VERSION=${KUBECTL_VERSION:-v1.27.3}
# The version of argocd
# semvesion:
# old: v2.1.5
# lastest: v2.7.5
ARGOCD_VERSION=${ARGOCD_VERSION:-v2.7.5}
# The version of argocd cli
# semver: https://github.com/argoproj/argo-cd/releases
# old: v2.1.5
# lastest: v2.7.5
ARGOCD_CLI_VERSION=${ARGOCD_CLI_VERSION:-v2.7.5}
# The version of kubeseal cli
# old: v0.16.0
# latest: 0.22.0
# semver: https://formulae.brew.sh/formula/kubeseal
KUBESEAL_CLI_VERSION=${KUBESEAL_CLI_VERSION:-v0.16.0}



- loki-stack : v2.9.11
- traefik-helm-char: v24.0.0, https://github.com/traefik/traefik-helm-chart/tags
- metrics-server: v3.11.0, https://kubernetes-sigs.github.io/metrics-server/