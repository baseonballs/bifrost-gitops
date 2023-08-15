
08.15.23 - Pull Image Issues

docker pull kubeflownotebookswg/profile-controller:v1.7.0 generates this message:
v1.7.0: Pulling from kubeflownotebookswg/profile-controller
no matching manifest for linux/arm64/v8 in the manifest list entries

docker command: docker pull kubeflownotebookswg/profile-controller:v1.7.0
+docker: docker pull --platform linux/arm64/v8 kubeflownotebookswg/profile-controller:v1.7.0
docker pull --platform linux/x86_64 kubeflownotebookswg/profile-controller:v1.7.0

last good build: docker pull kubeflownotebookswg/profile-controller:a2612f2
last good releasae: docker pull kubeflownotebookswg/profile-controller:v1.6.1

target rel: v1.6.1, digest: https://hub.docker.com/layers/kubeflownotebookswg/kfam/v1.6.1/images/sha256-f226fb44db571de3a576662f49bc8e1e74aa6767cf5e01cf77f3b2516851e977?context=explore
- kubeflownotebookswg/profile-controller:1.8.0-rc.0
1. ref: https://hub.docker.com/r/kubeflownotebookswg/profile-controller/tags
- kubeflownotebookswg/kfam:1.8.0-rc.0



List of Kubeflow Components with Image Pull Issues:

- kubeflownotebookswg/profile-controller:v.1.70
- docker.io/kubeflownotebookswg/poddefaults-webhook:v1.7.0
- docker.io/kubeflownotebookswg/kfam:v1.7.0
- docker.io/kubeflownotebookswg/jupyter-web-app:v1.7.0
- docker.io/kubeflownotebookswg/notebook-controller:v1.7.0
- docker.io/kubeflownotebookswg/poddefaults-webhook:v1.7.0
- docker.io/kubeflownotebookswg/tensorboard-controller:v1.7.0
- docker.io/kubeflownotebookswg/tensorboards-web-app:v1.7.0
- docker.io/kubeflownotebookswg/volumes-web-app:v1.7.0
