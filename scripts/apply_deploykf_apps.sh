#!/usr/bin/env bash

source ./env.sh

APP_RESOURCE=app-of-apps.yaml

function k8s_deploy_appofapp() {
    kubectl apply --filename ../${DIR_SRCVER}/${DIR_GENERATED}/${APP_RESOURCE}
}

k8s_deploy_appofapp