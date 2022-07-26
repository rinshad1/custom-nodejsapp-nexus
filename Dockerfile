# Use existing image from docker hub
FROM alpine

# Download and install some dependencies
RUN apk add --update redis

# Tell the image what to do when we start
# Our container created from this image
CMD ["redis-server"]
