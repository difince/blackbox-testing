#!/bin/bash

COLLECTION_PATH="collections/core-metadata-importer.postman_collection.json"
ENV_PATH="environment/core-metadata-docker-security.postman_environment.json"


echo "Info: import CoreMetadata's test data."

source $(dirname "$0")/security/setupSecurityAccount.sh -useradd

docker-compose -f ${docker_compose_test_tools} run --rm postman run ${COLLECTION_PATH} --environment=${ENV_PATH} \
  --insecure --global-var accessToken="$TOKEN"

source $(dirname "$0")/security/setupSecurityAccount.sh -userdel

echo "Info: CoreMetadata's test data imported"
