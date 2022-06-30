#!/usr/bin/env bash
docker-compose pull; docker-compose down --remove-orphans; docker-compose up -d --timeout 400 && docker image prune -f
