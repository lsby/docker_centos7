#!/usr/bin/env bash
docker.exe build -t lsby/centos7 .
docker-compose.exe up -d
