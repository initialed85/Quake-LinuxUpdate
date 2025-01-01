#!/bin/bash

set -e

function teardown() {
    docker stop -t 0 quake-wasm-build >/dev/null 2>&1 || true
    popd >/dev/null 2>&1 || true
}
trap teardown exit
pushd "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null 2>&1

REPO_NAME="$(git config --get remote.origin.url | cut -d ':' -f2- | cut -d '.' -f -1 | tr '[:upper:]' '[:lower:]')"

docker build --build-arg "DEBUG=${DEBUG:-}" -t "${REPO_NAME}:latest" -f ./Dockerfile .

echo -e "\nAll done!"

echo -e "\nBuilt artifacts:\n"

docker images | grep "${REPO_NAME}"
