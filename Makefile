.PHONY: regen-dh
regen-dh:
	openssl dhparam -out ~/infra/cloud/nginx/certs/dhparam.pem 2048

.PHONY: regen-keys
regen-keys:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ~/infra/metaproxy/nginx/certs/nginx-selfsigned.key -out ~/infra/metaproxy/nginx/certs/nginx-selfsigned.crt -subj '/CN=craaxkvm.epsevg.upc.es/O=Gesys./C=ES'
	chown -R user:user ~/infra/cloud/nginx/certs/

.PHONY: docker-cloud
docker-cloud:
	docker-compose -f ~/infra/cloud/docker-compose.yml pull
	docker-compose -f ~/infra/cloud/docker-compose.yml up -d

.PHONY: docker-cloud-regen
docker-cloud-regen:
	docker-compose -f ~/infra/cloud/docker-compose.yml down -v
	docker-compose -f ~/infra/cloud/docker-compose.yml pull
	docker-compose -f ~/infra/cloud/docker-compose.yml up -d --build --remove-orphans

.PHONY: docker-cloud-logs
docker-cloud-logs:
	docker-compose -f ~/infra/cloud/docker-compose.yml logs --tail 100 -f

.PHONY: docker-cloud-logs-nginx
docker-cloud-logs-nginx:
	docker-compose -f ~/infra/cloud/docker-compose.yml logs --tail 100 -f nginx

.PHONY: docker-cloud-logs-mongo
docker-cloud-logs-mongo:
	docker-compose -f ~/infra/cloud/docker-compose.yml logs --tail 100 -f mongo

.PHONY: docker-cloud-logs-mongo_express
docker-cloud-logs-mongo_express:
	docker-compose -f ~/infra/cloud/docker-compose.yml logs --tail 100 -f mongo_express

.PHONY: docker-cloud-logs-api
docker-cloud-logs-api:
	docker-compose -f ~/infra/cloud/docker-compose.yml logs --tail 100 -f api

.PHONY: docker-cloud-logs-nextjs
docker-cloud-logs-nextjs:
	docker-compose -f ~/infra/cloud/docker-compose.yml logs --tail 100 -f nextjs

.PHONY: docker-cloud-logs-mosquitto
docker-cloud-logs-mosquitto:
	docker-compose -f ~/infra/cloud/docker-compose.yml logs --tail 100 -f mosquitto

.PHONY: docker-cloud-logs-mqtt-subscriber
docker-cloud-logs-mqtt-subscriber:
	docker-compose -f ~/infra/cloud/docker-compose.yml logs --tail 100 -f mqtt-subscriber




