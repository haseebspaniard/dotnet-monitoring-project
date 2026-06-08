#!/bin/bash

# ============================================================
# monitor.sh — Health check for the .NET demo app container
# ============================================================

APP_URL="http://localhost:5000"
CONTAINER_NAME="dotnet-monitoring-app"
LOG_FILE="./monitor.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

echo "[$TIMESTAMP] Running health check..." | tee -a "$LOG_FILE"

# Check if container is running
if docker ps --filter "name=$CONTAINER_NAME" --filter "status=running" | grep -q "$CONTAINER_NAME"; then
    echo "[$TIMESTAMP] ✅ Container is running" | tee -a "$LOG_FILE"
else
    echo "[$TIMESTAMP] ❌ Container is NOT running! Attempting restart..." | tee -a "$LOG_FILE"
    docker compose up -d
    echo "[$TIMESTAMP] 🔄 Restart attempted" | tee -a "$LOG_FILE"
    exit 1
fi

# HTTP health check
HTTP_CODE=$(curl -o /dev/null -s -w "%{http_code}" --max-time 10 "$APP_URL")

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "[$TIMESTAMP] ✅ HTTP check passed (status: $HTTP_CODE)" | tee -a "$LOG_FILE"
else
    echo "[$TIMESTAMP] ❌ HTTP check failed (status: $HTTP_CODE)" | tee -a "$LOG_FILE"
    exit 1
fi

# Show container resource usage
echo "[$TIMESTAMP] 📊 Container stats:" | tee -a "$LOG_FILE"
docker stats "$CONTAINER_NAME" --no-stream --format \
    "CPU: {{.CPUPerc}} | Memory: {{.MemUsage}} | Net I/O: {{.NetIO}}" \
    | tee -a "$LOG_FILE"

echo "[$TIMESTAMP] Health check complete." | tee -a "$LOG_FILE"
echo "---" >> "$LOG_FILE"
