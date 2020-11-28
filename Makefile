# Please, Do not substitute tabs with spaces!

log-app:
	docker logs --tail 50 --follow --timestamps site_app_1

log-web:
	docker logs --tail 50 --follow --timestamps site_web_1

log-redis:
	docker logs --tail 50 --follow --timestamps site_redis_1

log-mysql:
	docker logs --tail 50 -f -t site_mysql_1

app:
	docker exec -ti site_app_1 bash

web:
	docker exec -ti site_web_1 bash

redis:
	docker exec -ti site_redis_1 bash

db:
	docker exec -ti site_mysql_1 bash

up:
	docker-compose -f docker-compose.yml up -d

build:
	docker-compose -f docker-compose.yml build

down:
	docker-compose -f docker-compose.yml down
