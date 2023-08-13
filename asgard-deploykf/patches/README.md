# https://elatov.github.io/2021/08/using-kustomize/


components: deploykf-core
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      ## ensure argo-cd does not remove the fields added by kyverno
      - RespectIgnoreDifferences=true
    retry:
      limit: 3
      backoff:
        duration: 5s
        maxDuration: 3m0s
        factor: 2


components: deploykf-dependencies

  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - Replace=true
    retry:
      limit: 3
      backoff:
        duration: 5s
        maxDuration: 3m0s
        factor: 2


kyverno: search: ServerSideApply

  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      ## kyverno will fail to sync if not using one of `Replace` or `ServerSideApply`
      ## https://kyverno.io/docs/installation/platform-notes/#notes-for-argocd-users
      - Replace=true
    retry:
      limit: 3
      backoff:
        duration: 5s
        maxDuration: 3m0s
        factor: 2

