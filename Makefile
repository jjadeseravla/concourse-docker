run:
	docker-compose up -d
initialise:
	./keys/generate
	brew cask install fly
	$(MAKE) run
	$(MAKE) login
	$(MAKE) set-up-pipeline
login:
	fly --target local login --concourse-url http://localhost:8080
set-up-pipeline:
	fly set-pipeline -c pipeline.yml -p FullStackApp -t local
