SHELL:=/bin/bash
VERSION=4.0

up:
	set -o allexport;\
	source redis/redis.env;\
	set +o allexport;\
	docker-compose up --build

build:
ifdef nocache
	docker build --no-cache -t mtgscan:$(VERSION) server/
else
	docker build -t mtgscan:$(VERSION) server/
endif

push: build
	docker push qfortier/mtgscan-server:$(VERSION)
