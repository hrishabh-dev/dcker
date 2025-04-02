# Use the official Python image from Docker Hub
FROM python:3.11-slim

# Set a working directory in the container
WORKDIR /app

# Copy requirements.txt first to leverage Docker cache
COPY requirements.txt ./

# Install Flask (and any other dependencies)
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your source code
COPY . .

# Expose the port the app runs on
EXPOSE 5000

# Set environment variable for Flask
ENV FLASK_APP=app.py  
# Make sure this points to your main Flask file

# Run the application
CMD ["flask", "run", "--host=0.0.0.0"]