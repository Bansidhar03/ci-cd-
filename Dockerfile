FROM python:alpine3.17
WORKDIR /app
COPY . /app
ENTRYPOINT ["python", "app.py"]
