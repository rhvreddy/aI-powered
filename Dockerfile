# Use the official Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy application files (Make sure app.py and requirements.txt exist in the same directory as Dockerfile)
COPY app.py /app/
COPY requirements.txt /app/

# Install dependencies from requirements.txt (instead of installing manually)
RUN pip install -r requirements.txt

# Expose port
EXPOSE 5000

# Start the application
CMD ["python", "app.py"]
