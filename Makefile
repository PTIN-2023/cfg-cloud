.PHONY: regen-dh
regen-dh:
	openssl dhparam -out ./nginx/certs/dhparam.pem 2048

.PHONY: regen-keys
regen-keys:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./nginx/certs/nginx-selfsigned.key -out ./nginx/certs/nginx-selfsigned.crt -subj '/CN=craaxkvm.epsevg.upc.es/O=Gesys./C=ES'
	chown -R user:user ./nginx/certs/

.PHONY: docker
docker:
	docker-compose pull
	docker-compose up -d

.PHONY: docker-cloud-regen
docker-regen:
	docker-compose down -v
	docker-compose pull
	docker-compose up -d --build --remove-orphans

.PHONY: docker-cloud-logs
docker-cloud-logs:
	docker-compose logs --tail 100 -f

.PHONY: docker-cloud-logs-nginx
docker-logs-nginx:
	docker-compose logs --tail 100 -f nginx

.PHONY: docker-cloud-logs-mongo
docker-logs-mongo:
	docker-compose logs --tail 100 -f mongo

.PHONY: docker-cloud-logs-mongo_express
docker-logs-mongo_express:
	docker-compose logs --tail 100 -f mongo_express

.PHONY: docker-cloud-logs-api
docker-logs-api:
	docker-compose logs --tail 100 -f api

.PHONY: docker-cloud-logs-nextjs
docker-logs-nextjs:
	docker-compose logs --tail 100 -f nextjs

.PHONY: docker-cloud-logs-mosquitto
docker-logs-mosquitto:
	docker-compose logs --tail 100 -f mosquitto

.PHONY: docker-cloud-logs-mqtt-subscriber
docker-logs-mqtt-subscriber:
	docker-compose logs --tail 100 -f mqtt-subscriber
