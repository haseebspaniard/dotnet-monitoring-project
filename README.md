# Project 15 — .NET App Deployment & Monitoring with Docker

## Overview
Deployed and monitored a real-world .NET 6 web application using Docker and Docker Compose.
The app includes a built-in monitoring dashboard showing real-time CPU and memory metrics,
a live weather forecast powered by the OpenWeather API, and a tools page for simulating
CPU load — useful for demonstrating autoscaling behaviour.

## Tech Stack
- .NET 6 (benc-uk/dotnet-demoapp)
- Docker & Docker Compose
- OpenWeather API (weather feature)
- Bash scripting (health check + monitoring)
- Ubuntu on VirtualBox

## Project Structure
```
dotnet-monitoring-project/
├── docker-compose.yml   # Compose deployment with healthcheck
├── .env                 # API key (not committed to GitHub)
├── .gitignore           # Excludes .env from version control
├── monitor.sh           # Container health check + auto-restart script
├── monitor.log          # Auto-generated log output
└── README.md
```
## Prerequisites
- Docker and Docker Compose installed
- An OpenWeather API key (free at openweathermap.org)

## Setup & Run

### 1. Clone the repo
```bash
git clone https://github.com/haseebspaniard/dotnet-monitoring-project.git
cd dotnet-monitoring-project
```

### 2. Create your .env file
```bash
echo "WEATHER_API_KEY=your_api_key_here" > .env
```

### 3. Start the app
```bash
docker compose up -d
```

### 4. Verify it's running
```bash
docker compose ps
```

## Access the App

| Page | URL | Description |
|------|-----|-------------|
| Info | http://localhost:5000 | System info, confirms running in Docker |
| Monitoring | http://localhost:5000/monitor | Real-time CPU & memory charts |
| Weather | http://localhost:5000/weather | Live forecast via OpenWeather API |
| Tools | http://localhost:5000/tools | Simulate CPU load for autoscale demos |

## Health Check Script
```bash
./monitor.sh
```
Checks if the container is running, performs an HTTP status check,
and prints live CPU/memory stats. Auto-restarts the container if it is down.

## Key Learnings
- Running a production-grade app with a single Docker Compose command
- Enabling optional app features using environment variables
- Managing secrets with `.env` files and `.gitignore` — never hardcoding keys
- Docker `healthcheck` configuration (interval, retries, start_period)
- `docker stats` for container-level resource monitoring
- HTTP health checks using `curl -w "%{http_code}"`
- `restart: unless-stopped` — restarts on crash, not on manual stop

## Screenshots




## Part of My Cloud & DevOps Learning Journey
- Course: Cloud & DevOps at Akumen by Qubiqon
- GitHub: https://github.com/haseebspaniard
- LinkedIn: https://www.linkedin.com/in/abdulhaseebas
- Medium: https://medium.com/@haseebabdul480
