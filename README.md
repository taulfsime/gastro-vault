# gastro-vault

## Database

### Start

```bash
docker compose up -d
```

### Check health and logs

```bash
docker compose ps
docker compose logs -f db
```

### Stop and remove

```bash
docker compose stop db
docker compose down -v
```

**Initialization scripts live in `db/init/`**
