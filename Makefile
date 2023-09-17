.PHONY: dev-start
dev-start:
	# remove existing images
	docker rmi -f appwrite-tour-of-heroes:1.0
	# building docker image
	docker build -t appwrite-tour-of-heroes:1.0 .
	# mounting /usr/src/app/node_modules forces Docker to use its own copy of node_modules instead of the host's copy.
	docker run \
		-v $(PWD):/app/ \
		-v /app/node_modules \
		-p 4200:4200 \
		--name appwrite-tour-of-heroes \
		appwrite-tour-of-heroes:1.0

# .PHONY: start
# start:
# 	# remove existing images
# 	docker rmi -f appwrite-tour-of-heroes:1.0
# 	# building docker image
# 	docker build -t appwrite-tour-of-heroes:1.0 .
# 	# mounting /usr/src/app/node_modules forces Docker to use its own copy of node_modules instead of the host's copy.
# 	docker run \
# 		-v /app/node_modules \
# 		--name appwrite-tour-of-heroes \
# 		-p 4200:4200 appwrite-tour-of-heroes:1.0

.PHONY: stop
stop:
	docker stop appwrite-tour-of-heroes
	docker rm appwrite-tour-of-heroes
