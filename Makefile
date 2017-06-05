export PATH := $(HOME)/bin:$(PATH):/usr/local/bin

POINT=$(shell echo $$((RANDOM%79+128512)) )
EMOJI=$(shell printf '%x' $(POINT) )

all: deploy

build:
	true

stage: build
	bundle exec jekyll build -c '_config.yml,_config.local.yml'

serve: stage
	cd _site; php -S localhost:9090

deploy: build
	git add -A _posts _data archives
	git commit -m "[Add] `printf "\U$(EMOJI)"` `date`: `fortune -s -n 61 | tr '\n' ' ' | sed -r 's/[[:blank:]]+/ /g'`"
	git push origin master
