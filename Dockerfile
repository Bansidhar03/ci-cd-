# pull official base image
FROM python:3.12.3

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install psycopg2 dependencies
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y gcc python3-dev musl-dev netcat-traditional


# set work directory
WORKDIR /usr/src/app


# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# copy project
COPY . .


# run entrypoint.sh
# # ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
