#!/bin/bash

# Function to check if Docker is installed
check_docker_installed() {
    if ! [ -x "$(command -v docker)" ]; then
        echo "Docker is not installed. Please install Docker first."
        exit 1
    fi
}

# Function to build and run the Flask application container
deploy_flask_app() {
    echo "Building the Docker image for Flask application..."
    docker build -t my_flask_app .
    echo "Docker image built successfully!"

    echo "Running the Flask application container..."
    docker run -d -p 5000:5000 --name flask_app my_flask_app
    echo "Flask application container is now running!"
}



# Main deployment function
main() {
    check_docker_installed

    # Build and run the Flask application container
    deploy_flask_app
}

# Call the main function
main
