#!/bin/bash

# Create a bootstrap master
openshift cli create -f redis-master.yaml

# Create a service to track the sentinels
openshift cli create -f redis-sentinel-service.yaml

# Create a replication controller for redis servers
openshift cli create -f redis-controller.yaml

# Create a replication controller for redis sentinels
openshift cli create -f redis-sentinel-controller.yaml

# Scale both replication controllers
openshift cli scale rc redis --replicas=3
openshift cli scale rc redis-sentinel --replicas=3
