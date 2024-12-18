# Use the official Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the entire project to /app
COPY . /app

# List the files in /app to ensure main.py is there (for debugging)
RUN ls -l /app

# Install dependencies from requirements.txt and pytest
RUN pip install --no-cache-dir -r requirements.txt

# Install pytest separately if you want it as part of your Docker image
RUN pip install pytest

# Expose port (for your application)
EXPOSE 5000

# Optionally, run tests if needed (remove if not required)
# RUN pytest --maxfail=1 --disable-warnings -q

# Start the application
CMD ["python", "/app/main.py"]
