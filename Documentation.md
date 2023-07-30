Title: Deployment of Flask Web Application using Docker on Ubuntu Server
-
Objective:
-
The objective of this document is to provide detailed instructions for deploying a Flask web application using Docker containers on an Ubuntu server. The application will be able to serve requests from clients and store data in a PostgreSQL database. The deployment process will be automated using Ubuntu scripts, and Git branches will be used to manage different stages of deployment.

Prerequisites:
-

** Ubuntu or compatible Linux distribution installed on the target server.

** Docker installed and running on the target server.

** Git installed on the target server.

1- Install Virtualenv and Set Up Python Virtual Environment:
-
** Ensure that Python is installed on the target server. If not, download and install the latest version of Python from the official Python website (https://www.python.org/).

** Install Virtualenv using pip, which should come pre-installed with Python:

    $pip install virtualenv

** Create a new virtual environment named "env1" (you can replace "env1" with any other name you prefer):

    $virtualenv env
    
** Activate the virtual environment:

    $source env/bin/activate

2- Install Flask:
-
Install flask inside the virtual environment:

    $pip install flask

3- Set Up the Flask Application:
-
Create a Python file (e.g., hello-world-app.py) that will contain the Flask application with the following code:

    from flask import Flask, jsonify

    app = Flask(__name__)

    @app.route('/api/v1/hello')
    def hello():
        return jsonify({'message': 'Hello World'})

    if __name__ == '__main__':
        app.run(host='0.0.0.0')

4- Containerize the Flask Application with Docker:
-
Create a Dockerfile named "Dockerfile" in the Task directory with the following:

    # Use the official Python image as the base image
    FROM python:3.8-slim

    # Set the working directory in the container
    WORKDIR /app

    # Copy the application code into the container
    COPY hello-world-app.py /app/

    # Install Flask and its dependencies
    RUN pip install flask

    # Expose the port the Flask app will run on
    EXPOSE 5000

    # Command to run the Flask application
    CMD ["python", "hello-world-app.py"]

5- Set Up PostgreSQL with Docker:
-
Create a "docker-compose.yml" file in the Task directory:

    version: '3'

    services:
      flask_app:
        build: .
        ports:
          - "5000:5000"
        depends_on:
          - db
        restart: always

      db:
        image: postgres
        environment:
          POSTGRES_USER: devops
          POSTGRES_PASSWORD: Asd12345
          POSTGRES_DB: flask-db
        volumes:
          - /home/data1:/var/lib/postgresql/data

    volumes:
      data:

6- Automate the Deployment Process with Ubuntu Script:
-
Create an ubuntu script named "flask.sh" for example, with the following content:

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
    
        # Build and run the Flask application container
        deploy_flask_app
    
        setup_postgres
    
    }
    
    # Call the main function
    main

7- Make the script executable:
- 
    $sudo chmod +x ./flask.sh

8- Run the script to deploy the application:
- 
    $sudo ./flask.sh

9- Check the running containers:
-
    $sudo docker ps

10- Access the Flask Application:
- 
To access the application from the host machine's web browser, open a web browser and enter the target machine's IP address or hostname, followed by the port number 5000.

    http://<target_machine_ip>:5000/api/v1/hello

Conclusion:
-
You have successfully deployed a Flask web application using Docker containers on an Ubuntu server. The application can now be accessed from any web browser connected to the target machine.
