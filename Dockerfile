# Use the official Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy application files
COPY app.py /app/
COPY requirements.txt /app/

# Install dependencies
RUN pip install flask pytest

# Expose port
EXPOSE 5000

# Start the application
CMD ["python", "app.py"]
