FROM debian:unstable-slim

WORKDIR /app
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

# Update the sources list to use the unstable repository
RUN echo "deb http://deb.debian.org/debian unstable main" > /etc/apt/sources.list

# Update and install required packages
RUN apt update -y && \
    apt install -y curl wget supervisor openjdk-11-jdk tzdata && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Download and extract the gz_client_bot.tar.gz file
RUN wget -O gz_client_bot.tar.gz https://github.com/semicons/java_oci_manage/releases/latest/download/gz_client_bot.tar.gz && \
    tar -zxvf gz_client_bot.tar.gz --exclude=client_config && \
    tar -zxvf gz_client_bot.tar.gz --skip-old-files client_config && \
    chmod +x sh_client_bot.sh

# Copy client configuration and supervisor configuration

COPY key.pem /app/key.pem
COPY client_config /app/client_config
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Start supervisor
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
