#!/bin/sh
ssh-keygen -t rsa -f docker_mysshd -C "Key for docker user for docker mysshd client" -N ""
ssh-keygen -t rsa -f vagrant_mysshd -C "Key for vagrant user for docker mysshd client" -N ""
ssh-keygen -t rsa -f root_mysshd -C "Key for root user for docker mysshd client" -N ""
