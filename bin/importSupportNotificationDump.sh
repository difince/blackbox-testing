#!/bin/bash

COLLECTION_PATH="collections/support-notifications-importer.postman_collection.json"
ENV_PATH="environment/support-notification-docker.postman_environment.json"


echo "Info: import SupportNotification's test data."

docker-compose -f ${docker_compose_test_tools} run --rm postman run ${COLLECTION_PATH} --environment=${ENV_PATH}

echo "Info: SupportNotification's test data imported"
