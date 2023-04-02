FROM debian:buster

# Install Redis and other necessary packages
RUN apt-get update && \
    apt-get install -y redis-server && \
    rm -rf /var/lib/apt/lists/*

# Copy the Redis configuration file
COPY tools/redis.conf /etc/redis/redis.conf

# Expose the Redis port
EXPOSE 6379
# RUN echo "net.core.somaxconn = 511" >> /etc/sysctl.conf && sysctl -p

# Start Redis with the custom configuration file
CMD [ "redis-server", "/etc/redis/redis.conf" ]
