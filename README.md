# DevOps-Task-1
Deploying a Dockerized Flask Application on Ubuntu Server

Prerequisites:
-
** Ensure the target machine has Ubuntu or a compatible Linux distribution installed.

** Make sure you system is up-to-date, by running:
   
    $sudo apt-get update

    $sudo apt-get upgrade  
  
** Make sure the machine has Docker installed and running.

    $sudo apt install -y docker.io

    $sudo systemctl enable --now docker
  
    $sudo usermod -aG docker $Username
  
** Install python.
   Ensure that Python is installed on your machine. If not, download and install the latest version of Python from the official Python website (https://www.python.org/).
   
** Virtualenv is a tool used to create isolated Python environments, you can install it using "pip":
   
      $pip install virtualenv


  Step 1: Clone the Git Repository:
-
** On the target machine, open a terminal or command prompt.

** Clone the Git repository containing the Flask application and Docker configurations.

** Change into the project directory using the following commands:

      $sudo git clone https://github.com/V374R/DevOps-Task-1.git
   
      $cd DevOps-Task-1


  Step 2: Create a Virtual Environment:
-
In the terminal or command prompt, run the following command to create a new virtual environment named "anyting you want", for example "ENV"

      $virtualenv ENV


  Step 3: Activate the Virtual Environment and install Flask:
-
To start using the virtual environment, you need to activate it. 

** For Unix/macOS:
  
     $source ENV/bin/activate
  
     $pip install flask


Step 4: Build the Docker Image:
-
** In the project directory, where the Dockerfile is located, build the Docker image using the following command:
   
      $sudo docker build -t my_flask_app .


  Step 5: Set Up PostgreSQL Data Volume:
-
** Create a directory on the target machine to serve as the data volume:

      $sudo mkdir -p /home/data1
   
      $sudo chown -R $Username:$Username /home/data1

** Modify the docker-compose.yml file to use a newly created directory as the data volume for the PostgreSQL container. Replace /home/data1 with the actual path you want to create(optional).


  Step 6: Run the Docker and Postgres containers:
-
      $sudo chmod +x ./flask.sh
      $sudo ./flask.sh


  Step 7: Access the Flask Application:
-
** The Flask application is now running on the target machine, you check the running containers by running the following command:

      $sudo docker ps
     
** To access the application from the host machine's web browser, open a web browser and enter the target machine's IP address or hostname, followed by the port number 5000.

      http://<target_machine_ip>:5000/api/v1/hello
  


    
  



