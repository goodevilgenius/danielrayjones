.PHONY: all serve clean

export PATH := $(HOME)/bin:$(PATH):/usr/local/bin
PORT ?= 4000
IMAGE=danjones000/danielrayjones/ruby-with-bundler:1.0.0

all: serve

Gemfile.lock:
	podman run --rm -v $(shell pwd):/app -w /app ruby:2.6.3 sh -c 'gem install bundler:2.0.2 && bundle install'

.image: Gemfile.lock
	podman build -t $(IMAGE) .
	podman image inspect $(IMAGE) | jq -r '.[0].Id' | tee .image

_config.local.yml:
	touch $@

_site/index.html: .image _config.local.yml index.html
	podman run --rm -v $(shell pwd):/app:rw -w /app $(IMAGE) bundle exec jekyll build -c '_config.yml,_config.local.yml'

serve: _site/index.html
	podman run --rm -it -v $(shell pwd):/app -w /app -p $(PORT):$(PORT) $(IMAGE) bundle exec jekyll serve -H 0.0.0.0 -P "$(PORT)" -c '_config.yml,_config.local.yml'

clean:
	rm -rf _site
