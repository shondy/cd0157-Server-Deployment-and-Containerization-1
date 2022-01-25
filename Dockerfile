# https://www.docker.com/blog/containerized-python-development-part-1/
# https://www.geeksforgeeks.org/docker-copy-instruction/
# set base image (host OS)
FROM python:stretch

COPY . /app
WORKDIR /app

RUN pip install --upgrade pip
RUN pip install -r requirements.txt


ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]
