docker pull ghcr.io/acnicholls/activity_client:local-amd64
docker pull ghcr.io/acnicholls/activity_api:local-amd64
docker pull ghcr.io/acnicholls/activity_proxy:local-amd64
docker pull ghcr.io/acnicholls/activity_db:local-amd64


docker compose -f docker-compose.ghcr-local.yml up 