#!/bin/bash

# Update and install necessary packages
sudo apt-get update
sudo apt-get install -y docker.io

# Build the Docker image
sudo docker build -t my_flask_app .

# Run the Flask app container
sudo docker run -d -p 5000:5000 --name flask_app my_flask_app
