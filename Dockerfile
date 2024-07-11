# Use the official Ubuntu image as the base image
# Here we are using ubuntu img that why we need to install node.js, but if would have chosen Node as base img then we need not to install node.js
# Therefore choosing good base image is important
FROM ubuntu

# Update the package lists and install curl
RUN apt-get update
RUN apt-get install -y curl

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - 
RUN apt-get install -y nodejs

# Upgrade existing packages (if any)
RUN apt-get upgrade -y

# Copy package.json and package-lock.json to the working directory (/app in the container)
# COPY src dest
COPY package.json package.json
COPY package-lock.json package-lock.json

# Copy main.js to the working directory (/app in the container)
COPY main.js main.js

# Install npm dependencies based on package.json
RUN npm install

# Specify the command to run when the container starts or when someone tries to run this image
ENTRYPOINT [ "node", "main.js" ]

# Now run docker build -t name_u_want_to_give_to_your_imge . 
# here . represents my Dockerfile exists in this folder only

# Now open CMD
# docker run -t image_name

# Now do port mapping 
# docker run it -p 8000:8000 custom-docker-img-1 image_name
# docker push swatigoel02/custom-docker-img-1
