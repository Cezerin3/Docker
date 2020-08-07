#!/bin/bash
export $(grep -v '^#' .env | xargs)

git clone https://github.com/cezerin2/cezerin2
cd cezerin2
git checkout 28a61fc295bbd7f0f9b1fca99f9e44fdeffd9af1
cd ..

git clone https://github.com/cezerin2/cezerin2-admin
cd cezerin2-admin
git checkout 82e112acd4be2cd71fffc8d470db555e9473be77
cd ..

git clone https://github.com/cezerin2/cezerin2-store
cd cezerin2-store
git checkout 6ee670cfb2b734480a4e75df0d7970425d56e64b
cd ..

docker-compose run --rm cezerin-api npm install

docker-compose run --rm cezerin-store npm install
docker-compose run --rm cezerin-store npm install --save-dev pm2

docker-compose run --rm cezerin-admin npm install
docker-compose run --rm cezerin-admin npm install --save-dev pm2