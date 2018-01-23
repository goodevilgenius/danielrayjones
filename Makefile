export PATH := $(HOME)/bin:$(PATH):/usr/local/bin

all: serve

stage:
	bundle exec jekyll build -c '_config.yml,_config.local.yml'

serve:
	bundle exec jekyll serve -c '_config.yml,_config.local.yml'
