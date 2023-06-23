.PHONY: regen-dh
regen-dh:
	openssl dhparam -out ./nginx/certs/dhparam.pem 2048

.PHONY: regen-keys
regen-keys:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./nginx/certs/nginx-selfsigned.key -out ./nginx/certs/nginx-selfsigned.crt -subj '/CN=craaxkvm.epsevg.upc.es/O=Gesys./C=ES'
	chown -R user:user ./nginx/certs/

.PHONY: restart
restart:
	docker-compose pull
	docker-compose up -d

.PHONY: regen
regen:
	docker-compose down -v
	docker-compose pull
	docker-compose up -d --build --remove-orphans

.PHONY: logs
logs:
	docker-compose logs --tail 100 -f

.PHONY: logs-nginx
logs-nginx:
	docker-compose logs --tail 100 -f nginx

.PHONY: logs-mongo
logs-mongo:
	docker-compose logs --tail 100 -f mongo

.PHONY: logs-mongo_express
logs-mongo_express:
	docker-compose logs --tail 100 -f mongo_express

.PHONY: logs-api
logs-api:
	docker-compose logs --tail 100 -f api

.PHONY: logs-nextjs
logs-nextjs:
	docker-compose logs --tail 100 -f nextjs

.PHONY: logs-mosquitto
logs-mosquitto:
	docker-compose logs --tail 100 -f mosquitto

.PHONY: logs-mqtt-subscriber
logs-mqtt-subscriber:
	docker-compose logs --tail 100 -f mqtt-subscriber
