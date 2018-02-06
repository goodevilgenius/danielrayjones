export PATH := $(HOME)/bin:$(PATH):/usr/local/bin
IP ?= 127.0.0.1
PORT ?= 4000

all: serve

stage:
	bundle exec jekyll build -c '_config.yml,_config.local.yml'

serve:
	bundle exec jekyll serve -H "$(IP)" -P "$(PORT)" -c '_config.yml,_config.local.yml'
