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
<img width="1232" height="632" alt="image (3)" src="https://github.com/user-attachments/assets/be39ceaa-b65e-4ea9-9103-687cd3cdec71" />
<img width="1300" height="633" alt="image (2)" src="https://github.com/user-attachments/assets/4f18f3ba-3bce-47c5-8447-a42bf3100343" />
<img width="1232" height="634" alt="image" src="https://github.com/user-attachments/assets/65d8579a-5c6c-45a7-93ea-44b694ec2504" />
<img width="1232" height="630" alt="image (1)" src="https://github.com/user-attachments/assets/f9d1fa47-2ded-4701-bad9-12faff1819f3" />


## Author

**Abdul Haseeb**
Cloud & DevOps Learner | Former CS Teacher (3.5 years)

[LinkedIn](https://www.linkedin.com/in/abdulhaseebas)
[GitHub](https://github.com/haseebspaniard)
[Medium](https://medium.com/@haseebabdul480)
