# build phase
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
 
# run phase
FROM nginx
# from=0 means we want to copy from the build with index 0 (build phase)
EXPOSE 80 # instructs aws elastic beanstalk to expose this port. locally, this does nothing
COPY --from=0 /app/build /usr/share/nginx/html
# no need for explicit command to run the nginx, the default command of the container created from this image is starting it for us
