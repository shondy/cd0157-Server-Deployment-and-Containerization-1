# https://www.docker.com/blog/containerized-python-development-part-1/
# https://www.geeksforgeeks.org/docker-copy-instruction/
# set base image (host OS)
FROM python:3.8-buster

# set the working directory in the container
WORKDIR /add

# copy the dependencies file to the working directory
COPY requirements.txt .

# install pip
RUN pip install --upgrade pip

# install dependencies
RUN pip install -r requirements.txt

# copy the module main to the working directory
COPY main.py .

# Define an entrypoint which will run the main app using the Gunicorn WSGI server
ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]
