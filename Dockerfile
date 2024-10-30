# Use the latest Ubuntu base image
FROM ubuntu:latest

# Install necessary dependencies and download XAMPP installer
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://downloadsapachefriends.global.ssl.fastly.net/xampp/7.4.10/xampp-linux-x64-7.4.10-0-installer.run && \
    chmod +x xampp-linux-x64-7.4.10-0-installer.run && \
    ./xampp-linux-x64-7.4.10-0-installer.run

# Expose the port for XAMPP
EXPOSE 8081

# Command to start XAMPP
CMD ["/opt/lampp/lampp", "start"]
