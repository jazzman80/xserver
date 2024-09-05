# Install Operating system and dependencies
FROM ubuntu:24.04

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y curl git unzip xz-utils zip libglu1-mesa
RUN apt install snapd -y
#RUN apt-get clean
ENV PATH="/snap/bin:${PATH}"
RUN snap install flutter --classic

# download Flutter SDK from Flutter Github repo
RUN #git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Set flutter environment path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Run flutter doctor
RUN flutter doctor

# Enable flutter web
RUN flutter channel master
RUN flutter upgrade
RUN flutter config --enable-linux

# Copy files to container and build
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter build linux

# Record the exposed port
EXPOSE 8080

# make server startup script executable and start the web server
RUN ["/app/build/linux/release/bundle/xserver"]