#!/bin/sh
# -d is to create a docker container that runs as a daemon
# -P
# --name to give the container a name
# note all the above is mainly available in the docker-machine
docker run -d -P --name testsshd drgeb/mysshd:latest