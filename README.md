# Meme Backend Final

Spring Boot backend for the meme library app.

## Local Run

Set the database password for the local PostgreSQL user before starting:

```sh
export DB_PASSWORD='your-local-postgres-password'
./gradlew bootRun
```

The API runs on:

```text
http://localhost:8080
```

## Render Deploy

This repository includes `render.yaml` and `Dockerfile`.
Create a Render Blueprint from this repository to deploy:

- a Docker web service
- a Render PostgreSQL database
- the required database/Auth0/CORS environment variables
