# Use the official Python runtime as a parent image
FROM python:3.9-slim

# Install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory within the container
WORKDIR /app

# Copy the requirements.txt and install the Python dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

# Copy your application code to the container
COPY . /app

# Expose the port that your Flask application is running on (replace with the appropriate port)
EXPOSE 5000

# Define the command to run your Flask application
CMD ["python", "chatbot.py"]
