# importing base image
FROM python:3.9

# updating docker host or host machine
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# copying requirement.txt file to present working directory
WORKDIR /code
COPY requirements.txt /code/

# installing dependency in container
RUN pip install -r requirements.txt
COPY . /code/
RUN python manage.py migrate
CMD python manage.py runserver 0.0.0.0:8000
