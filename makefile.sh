#!/bin/bash

# Resolve Docker binary (prefer Docker Desktop on macOS, fallback to PATH)
DOCKER="/Applications/Docker.app/Contents/Resources/bin/docker"
if [ ! -x "$DOCKER" ]; then
  DOCKER="$(command -v docker)"
fi

if [ -z "$DOCKER" ]; then
  echo "Docker binary not found. Please install Docker or set DOCKER path."
  exit 1
fi

up() {
  "$DOCKER" compose -f docker-compose.yml up -d
}

up_db() {
  "$DOCKER" compose -f docker-compose.db.yml up -d
}

up_redis() {
  "$DOCKER" compose -f docker-compose.redis.yml up -d
}

up_kafka() {
  "$DOCKER" compose -f docker-compose.kafka.yml up -d
}

ssh_mysql() {
  "$DOCKER" exec -it c-mysql bash
}

ssh_redis() {
  "$DOCKER" exec -it c-redis redis-cli
}

down() {
  "$DOCKER" compose down --remove-orphans
}

print_path() {
  echo "$PATH"
}

up_sql_server() {
  "$DOCKER" compose -f docker-compose.sql-server.yaml up -d
}

usage() {
  echo "Usage: $0 <command>"
  echo ""
  echo "Commands:"
  echo "  run             - Alias for up"
  echo "  up              - docker compose up -d (docker-compose.yml)"
  echo "  up-db           - docker compose up -d (docker-compose.db.yml)"
  echo "  up-redis        - docker compose up -d (docker-compose.redis.yml)"
  echo "  up-kafka        - docker compose up -d (docker-compose.kafka.yml)"
  echo "  ssh-mysql       - docker exec -it c-mysql bash"
  echo "  ssh-redis       - docker exec -it c-redis redis-cli"
  echo "  down            - docker compose down --remove-orphans"
  echo "  print-path      - print PATH"
  echo "  up-sql-server   - docker compose up -d (docker-compose.sql-server.yaml)"
}

case "$1" in
  run)
    up
    ;;
  up)
    up
    ;;
  up-db)
    up_db
    ;;
  up-redis)
    up_redis
    ;;
  up-kafka)
    up_kafka
    ;;
  ssh-mysql)
    ssh_mysql
    ;;
  ssh-redis)
    ssh_redis
    ;;
  down)
    down
    ;;
  print-path)
    print_path
    ;;
  up-sql-server)
    up_sql_server
    ;;
  *)
    usage
    exit 1
    ;;
esac