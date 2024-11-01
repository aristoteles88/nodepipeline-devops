FROM node:12
RUN apt update && apt install git -y && apt install imagemagick -y;

WORKDIR /ecs-app

COPY package*.json ./
COPY . .

RUN npm install
RUN chown -R node:node /ecs-app

ENV NODE_ENV=production
ENV ENV_ECS=true
USER root
EXPOSE 80

ENTRYPOINT ["npm", "start"]
