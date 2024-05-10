#!/bin/bash

set -e

function teardown() {
    docker stop -t 0 quake-wasm-build >/dev/null 2>&1 || true
    popd >/dev/null 2>&1 || true
}
trap teardown exit
pushd "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null 2>&1

REPO_NAME="$(git config --get remote.origin.url | cut -d ':' -f2- | cut -d '.' -f -1 | tr '[:upper:]' '[:lower:]')"

if ! docker images | grep "${REPO_NAME}" >/dev/null 2>&1; then
    echo "error: failed to find ${REPO_NAME}:latest Docker image; (hint: ./build.sh)"
    exit 1
fi

docker run --rm -it -p 26000:26000/tcp -p 26000:26000/udp --name quake-server "${REPO_NAME}:latest"
