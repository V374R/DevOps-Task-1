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
CMD ["python", "app.py"]
