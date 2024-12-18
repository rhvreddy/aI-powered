# Use the official Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the entire project to /app
COPY . /app

# Install dependencies from requirements.txt
RUN pip install -r requirements.txt

# Expose port
EXPOSE 5000

# Set the volume for the app directory
VOLUME ["/app"]

# Start the application
CMD ["python", "app.py"]
