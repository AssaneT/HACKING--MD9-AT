FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  npm i pm2 -g && \
  rm -rf /var/lib/apt/lists/*
  
RUN git clone  https://github.com/HACKING995/HACKING--MD9 /root/my_app
WORKDIR /root/my_app/


COPY package.json .
RUN npm ci install pm2 -g
RUN npm ci install

COPY . .

EXPOSE 8000

CMD ["npm","run","web"]
