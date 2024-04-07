#!/bin/bash
docker build -t mywebserver .
docker-compose down || true
docker-compose up -d 