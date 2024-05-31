# Use a base image with JDK and other dependencies
FROM mcr.microsoft.com/vscode/devcontainers/java:0-11

# Install wget and unzip
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Download and install Android SDK command-line tools
RUN mkdir -p /usr/local/android-sdk/cmdline-tools && \
    wget -q https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip -O commandlinetools.zip && \
    unzip commandlinetools.zip -d /usr/local/android-sdk/cmdline-tools && \
    rm commandlinetools.zip && \
    mv /usr/local/android-sdk/cmdline-tools/tools /usr/local/android-sdk/cmdline-tools/latest

# Set environment variables for Android SDK
ENV ANDROID_HOME /usr/local/android-sdk
ENV PATH ${ANDROID_HOME}/cmdline-tools/latest/bin:$PATH
