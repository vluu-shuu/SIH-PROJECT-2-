# C-MINE Intelligence — Render deployment

This project is prepared for Render using Docker.

## Render settings

If creating the service manually:
- Type: Web Service
- Runtime: Docker
- Plan: Free
- Health check: `/api/health`

The Dockerfile installs:
- Node.js 24
- Tesseract OCR
- Poppler utilities

The server already reads Render's `PORT` environment variable and listens on the required host.

## Important free-tier limitation

Render Free web services have an ephemeral filesystem. The SQLite database and uploaded files can be lost when the service restarts, redeploys or spins down. This is acceptable for a live SIH prototype/demo, but it is not a production persistence architecture.

For a production deployment, move the knowledge store to managed persistent storage/database and use object storage for uploaded documents.

## Cost

The SIH demo can run on Render's Free web-service plan. No paid AI API is required by C-MINE's default query path.
