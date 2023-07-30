# DevOps-Task-1
Deploying a Dockerized Flask Application on Ubuntu Server

Prerequisites:

1. Ensure the target machine has Ubuntu or a compatible Linux distribution installed.
2. Make sure you system is up-to-date, by running:
  #sudo apt-get update
  #sudo apt-get upgrade  
3. sure the machine has Docker installed and running.
  #sudo apt install -y docker.io
  #sudo systemctl enable --now docker
  #sudo usermod -aG docker <your username>
4. Install python.
   Ensure that Python is installed on your machine. If not, download and install the latest version of Python from the official Python website (https://www.python.org/).
5. Install Virtualenv:
   Virtualenv is a tool used to create isolated Python environments. You can install it using "pip":
   #pip install virtualenv


  Step 1: Clone the Git Repository:

1. On the target machine, open a terminal or command prompt.
2. Clone the Git repository containing the Flask application and Docker configurations.
3. Change into the project directory using the following command:

      #git clone https://github.com/V374R/DevOps-Task-1.git
      #cd DevOps-Task-1


  Step 2: Create a Virtual Environment:

In the terminal or command prompt, run the following command to create a new virtual environment named "<anyting you want>", for example "ENV"

      #virtualenv ENV


  Step 3: Activate the Virtual Environment and install Flask:

To start using the virtual environment, you need to activate it. 

- For Unix/macOS:
      #source ENV/bin/activate
      #pip install flask


  Step 4: Build the Docker Image:

1. In the project directory, where the Dockerfile is located, build the Docker image using the following command:
   
      #docker build -t my_flask_app .


  Step 5: Set Up PostgreSQL Data Volume:

1. Create a directory on the target machine to serve as the data volume:

      #sudo mkdir -p /home/data1
      #sudo chown -R <your username>:<your username> /home/data1

2. Modify the docker-compose.yml file to use a newly created directory as the data volume for the PostgreSQL container. Replace /home/data1 with the actual path you want to create.


  Step 6: Run the Docker and Postgres containers:

      #chmod +x ./flask.sh
      #sudo ./flask.sh


  Step 7: Access the Flask Application:

1. The Flask application is now running on the target machine.
2. To access the application from the host machine's web browser, open a web browser and enter the target machine's IP address or hostname, followed by the port number 5000.
   Example: http://<target_machine_ip>:5000/api/v1/hello
  


    
  



