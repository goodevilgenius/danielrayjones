.PHONY: all build-image serve clean

export PATH := $(HOME)/bin:$(PATH):/usr/local/bin
PORT ?= 4000
IMAGE=ruby-with-bundler:2.6.3-2.0.2

all: serve

build-image:
	docker build -t $(IMAGE) .

_config.local.yml:
	touch $@

_site/index.html: build-image _config.local.yml
	docker run -u $(shell id -u) --rm -v $(shell pwd):/app -w /app $(IMAGE) bundle exec jekyll build -c '_config.yml,_config.local.yml'

serve: _site/index.html
	docker run --rm -it -v $(shell pwd):/app -w /app -p $(PORT):$(PORT) $(IMAGE) bundle exec jekyll serve -H 0.0.0.0 -P "$(PORT)" -c '_config.yml,_config.local.yml'

clean:
	rm -rf _site
