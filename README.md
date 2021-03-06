# Dockerfile for DEV (Dockerfile.dev)

We create a Dockerfile.dev for dev environment only. To use this file in building an image we need to run:
### `docker build -f Dockerfile.dev .`

# Running the created image with ID <image_id> on port 3000

We need to run the following command:
### `docker run -it -p 3000:3000 <image_id>`

# Using docker volumes to have real-time updates

If we want to keep developing and have the changes taken into account in our running container, we need to setup a volume. The container will contain a reference to our local folder.

### docker run -it -p 3000:3000 -v /app/node_modules -v $(pwd):/app <image_id>

"-v $(pwd):/app" = create a volume by mapping the Present Working Directory to "app" folder in the running container (don't forget that we have in Dockerfile.dev the folowing line: "WORKDIR '/app'").

"-v /app/node_modules" = create a volume that will instruct Docker to not map "node_modules" and keep the folder created within the running container.

# Using docker-compose instead of docker commands

Check "docker-compose.yml" file. Run then:

### docker-compose up

# Running the tests in interactive mode

Without docker-compose:
### docker run -it <image_id> npm run test

With docker-compose:
Check the second "tests" service from "docker-compose.yml" file. It exists just for running tests

# Dockerfile for production (Dockerfile)

This dockerfile will create a different image than the one used for dev environment. This container will start an "nginx" server as last step.

Dockerfile will contain 2 phases:
* Build phase: using node:alpine, copying the package.json file, install dependencies and running "npm run build"
* Run phase: using nginx, copying the result of "npm run build" and starting nginx server

# Running the app in production mode

Building the image:
### docker build .

Running a container with that image (default nginx port is 80):
### docker run -p 8080:80 <image_id>

# Travis CI
Framework used for Continous Integration, an alternative to Gitlab. Everytime we will push something on Github, Travis will be informed and do some work. For this project Travis will be used for:
* Running the tests
* Deploying the app to AWS

### .travis.yml

# Getting Started with Create React App

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

The page will reload if you make edits.\
You will also see any lint errors in the console.

### `npm test`

Launches the test runner in the interactive watch mode.\
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `npm run build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### `npm run eject`

**Note: this is a one-way operation. Once you `eject`, you can’t go back!**

If you aren’t satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you’re on your own.

You don’t have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn’t feel obligated to use this feature. However we understand that this tool wouldn’t be useful if you couldn’t customize it when you are ready for it.

## Learn More

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).

### Code Splitting

This section has moved here: [https://facebook.github.io/create-react-app/docs/code-splitting](https://facebook.github.io/create-react-app/docs/code-splitting)

### Analyzing the Bundle Size

This section has moved here: [https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size](https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size)

### Making a Progressive Web App

This section has moved here: [https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app](https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app)

### Advanced Configuration

This section has moved here: [https://facebook.github.io/create-react-app/docs/advanced-configuration](https://facebook.github.io/create-react-app/docs/advanced-configuration)

### Deployment

This section has moved here: [https://facebook.github.io/create-react-app/docs/deployment](https://facebook.github.io/create-react-app/docs/deployment)

### `npm run build` fails to minify

This section has moved here: [https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify](https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify)
