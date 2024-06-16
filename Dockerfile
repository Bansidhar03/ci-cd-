# pull official base image
FROM python:3
WORKDIR /usr/src/app
# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
COPY requirements.txt /app
RUN pip install --no-cache-dir -r requirements.txt
# install psycopg2 dependencies
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y gcc python3-dev musl-dev netcat-traditional
COPY . /usr/src/app
# set work directory
# install dependencies
RUN pip install --upgrade pip
EXPOSE 8000

# run entrypoint.sh
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
