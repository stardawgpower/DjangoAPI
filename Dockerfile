# importing base image
FROM python:3.9

# updating docker host or host machine
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# copying requirement.txt file to present working directory
COPY requirements.txt .

# installing dependency in container
RUN pip install -r requirements.txt

# copying all the files to present working directory
RUN django-admin startproject django_api .
COPY settings.py /django_api
# WORKDIR /django_api
# running server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]