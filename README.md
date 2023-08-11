
# Project Code Structure

We use the Asgard as the foundation of all things hybrid cloud infrastructure. Asgard is a norse name for the place where the gods live.
The Bifrost is the infrastructure foundation such as bootstrap, networking, and storage. Bifrost will server all tenants using realms.  All realsm lead to the Bifrost. We will also use the gods such as Thor, Tyr, Loki, etc.

## 9 Realms: https://skjalden.com/nine-realms-in-norse-mythology/

Gods:  Odin - ruler of the Asgard, and chief of Aesir.  he is married to Frigg, Queen of Aesir.  Inside the gates of Asgard is Valhala, the purgatory for the afterlife of Folkvangr (ruled by goddes Freya)

- Niflheim: The Realm of Fog & Mist, the darkest and coldest region of allt he realms
- Muspelheim: Land of Fire
- Asgard - Home of the Gods
- Midgard - Home of the Humans
- Jotunheim - Home of the Giants
- Vanaheim - Home fo the Vanir . The old branch of the gods;these are masters of sorcery and magic.
- Alfheim  - Home of the Light Elves
- Svartalheim - Home of the Dwarves
- Helheim - Home of dishonorable dead (basically hell)


# Concepts of bifrost-gitops

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

kubectl get svc -n deploykf-istio-gateway

namespace: deploykf-istio-gateway
service-name: deploykf-gateway

// port fowarod
kubectl port-forward -n deploykf-istio-gateway svc/deploykf-gateway 8080:8080

doing so gives an error:
ExtAuthz did not set 'x-auth-request-email' header
