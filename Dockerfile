# Use an official Python runtime as a parent image
FROM python:3.8

RUN apt-get update -y \
  && apt-get upgrade -y \
  && apt-get install default-libmysqlclient-dev -y \
  && rm -rf /var/lib/apt/lists/*

# Set environment variables for Django
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
# ENV DJANGO_DB_HOST localhost  # Specify the hostname or IP of your local MySQL server
# ENV DJANGO_DB_PORT 3306       # Specify the MySQL server port (default is 3306)
# ENV DJANGO_DB_NAME project    # Specify the name of your MySQL database
# ENV DJANGO_DB_USER rohit      # Specify the MySQL username
# ENV DJANGO_DB_PASSWORD sagar
# Create and set the working directory
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app/

# Expose the port on which the Django app will run
EXPOSE 8000

# Command to run your application
# RUN python manage.py makemigrations
# RUN python manage.py migrate

# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
