REGISTRY := $(or $(REGISTRY), ghcr.io/blackreloaded/backup)
TAG := $(or $(TAG), test)

push: web rdiff
	docker push "${REGISTRY}/web:${TAG}"
	docker push "${REGISTRY}/rdiff:${TAG}"

.PHONY: web
web:
	docker build --rm --force-rm --pull -t "${REGISTRY}/web:${TAG}" web

runweb: web
	docker run -ti -p 8080:8080 "${REGISTRY}/web:${TAG}"

.PHONY: rdiff
rdiff:
	docker build --rm --force-rm --pull -t "${REGISTRY}/rdiff:${TAG}" rdiff

runrdiff: rdiff
	docker run -ti "${REGISTRY}/rdiff:${TAG}"