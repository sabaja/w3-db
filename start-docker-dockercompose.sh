#!/bin/bash

echo "Starting PostgreSQL container..."
docker compose up -d

echo "Container started"
docker ps | grep w3school-postgres
