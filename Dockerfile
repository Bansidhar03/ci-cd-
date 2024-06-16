# Use the official Python image from Docker Hub
FROM python:3.8

# Set the working directory inside the container
WORKDIR /usr/src/app

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Copy requirements.txt to the container at /usr/src/app/
COPY requirements.txt .

# Install dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install psycopg2 dependencies (assuming you need it for PostgreSQL)
RUN apt-get update && apt-get install -y gcc python3-dev musl-dev netcat

# Copy the current directory contents into the container at /usr/src/app/
COPY . .

# Upgrade pip to the latest version
RUN pip install --upgrade pip

# Expose port 8000 to allow communication to/from server
EXPOSE 8000

# Run entrypoint.sh when the container starts
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
