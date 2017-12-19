.PHONY:	build push

IMAGE = logging
TAG = 2.0 

build:
	docker build -t abakus/$(IMAGE):$(TAG) .

push:
	docker push abakus/$(IMAGE):$(TAG)
