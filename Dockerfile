FROM node:alpine
RUN apk add --update bash tree \
	&& rm -rf /var/cache/apk/*

RUN npm install -g yo generator-asf@0.0.14
RUN npm --force cache clear
RUN mkdir /yo
RUN chown -R node:node /yo \
	&& chown -R node:node /usr/local/lib/node_modules
USER node

WORKDIR /yo

CMD ["asf", "create-service", "--no-insight", "--config", ".asfconfig"]