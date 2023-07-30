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



# Function to set up the PostgreSQL container
setup_postgres() {
    echo "Setting up the PostgreSQL container..."
    docker run -d -p 5432:5432 \
        -e POSTGRES_USER=devops \
        -e POSTGRES_PASSWORD=Asd12345 \
        -e POSTGRES_DB=flask-db \
        -v /home/data1:/var/lib/postgresql/data \
        --name postgres_container \
        postgres
    echo "PostgreSQL container is now running!"
}


# Main deployment function
main() {
    check_docker_installed

    deploy_flask_app

    setup_postgres
}

# Call the main function
main
