# Use the official Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the entire project to /app
COPY . /app

# List the files in /app to ensure main.py is there
RUN ls -l /app

# Install dependencies from requirements.txt
RUN pip install -r requirements.txt

# Expose port
EXPOSE 5000

# Start the application
CMD ["python", "/app/main.py"]
