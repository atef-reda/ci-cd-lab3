# Use Jenkins inbound agent as base image
FROM jenkins/inbound-agent:latest

# Switch to root to install aws-cli
USER root

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    groff \
    less \
    && rm -rf /var/lib/apt/lists/*

# Install AWS CLI v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" && \
    unzip /tmp/awscliv2.zip -d /tmp && \
    /tmp/aws/install && \
    rm -rf /tmp/aws /tmp/awscliv2.zip

# Switch back to Jenkins user
USER jenkins

