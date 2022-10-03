# build phase tag as builder
FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . . 

RUN npm run build

# run phase  in app/build/
FROM nginx
# from where to 
COPY --from=builder /app/build /usr/share/nginx/html

# default command nginx starts it auto