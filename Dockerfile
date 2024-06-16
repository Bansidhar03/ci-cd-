# Use the official Python image from the Docker Hub as a base image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt /app/

# Install any dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Ensure Flask is installed and available in the PATH
RUN pip install flask

# Copy the rest of the application code into the container at /app
COPY . /app

# Expose the port that the Flask app runs on
EXPOSE 5000

# Set the environment variable to tell Flask to run the app
ENV FLASK_APP=app.py

# Specify the command to run on container start
CMD ["flask", "run", "--host=0.0.0.0"]
