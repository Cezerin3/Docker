### Cezerin 2 with Minio, Image Resize and Auto HTTPS in Docker
Part of https://github.com/Cezerin2/cezerin2 

#### Installation and run on your VPS, VDS (Ubuntu example)
- **BEFORE RUN APP** you must configure dns. You need make 4 A-record (its require for HTTPS)
    - example.com
    - admin.example.com
    - static.example.com

- Install Docker `curl -fsSL https://get.docker.com -o get-docker.sh` and `sudo sh get-docker.sh`
- Install Docker Compose `sudo apt-get install docker-compose`
- Copy .env file and configure your app `cp .env-example .env`
- Install all app and deps run `master-install.sh` (pull required version cezerin (api, store, admin) and install deps)
- Run `docker-compose up -d`
- Wait run your app, open in browser `https://example.com`
- When app started - setup the app `docker-compose exec cezerin-api npm run setup admin@example.com http://localhost:3000`


https://example.com - store

https://example.com/api - api (server)

https://example.com/ajax - api (client)

https://admin.example.com - admin

https://static.example.com - image resize service

http://example.com:9001 - minio (HTTP only)

#### Run development in LocalMachine with auto-restart on file edit (Ubuntu example)
*ATTENTION!* temporary auto-restart works only on cezerin-api

- Copy `.env-example-dev` file and configure your app `cp .env-example-dev .env`
- Install all app and deps run `master-install.sh` (pull required version cezerin (api, store, admin) and install deps)
- Run `docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d`
- Wait run your app, open in browser `http://localhost`
- When app started - setup the app `docker-compose exec cezerin-api npm run setup admin@example.com http://localhost`

http://localhost - store

http://localhost/api - api (server)

http://localhost/ajax - api (client)

http://localhost:3002 - admin

http://localhost:8887 - image resize service

http://localhost:9001 - minio
