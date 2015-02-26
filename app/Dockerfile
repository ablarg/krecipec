FROM dockerfile/ruby-runtime
WORKDIR /app
RUN mkdir -p /var/logs
CMD ["rackup", "-p", "8080", "-E", "production"]

