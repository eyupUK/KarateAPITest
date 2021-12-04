APP_IMAGE=:latest
APP_RUNNING_PORT=4000

start:
	docker run -it -d -p 4000:4000 --name sbg-gaming-seit-tech-test ngr05/sbg-gaming-seit-tech-test
stop:
	docker stop sbg-tech-test-app
	docker rm sbg-tech-test-app

logs:
	docker logs -f sbg-tech-test-app

test: stop start
	# Feel free to put your test commands here
	mvn test -Dcucumber.options="--tags '@getall or @addgame or @wip or @schemaValidation or @update'"