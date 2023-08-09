#!/usr/bin/env bash

set -euo pipefail

PWD_PATH=$(cd "$(dirname "$0")" && pwd)
cd "$PWD_PATH"

# source the environment vaqriable
source ./env.sh

rm -rf ${DIR_SRCVER}

function generate_manifests() {
  deploykf generate \
    --source-version ${SEMVER} \
    --values ../values.yaml \
    --output-dir ../${DIR_SRCVER}/${DIR_GENERATED}
}


generate_manifests