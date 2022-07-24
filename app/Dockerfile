FROM python:3.8-slim-buster

WORKDIR /python-docker

RUN pip3 install flask

COPY app.py .
EXPOSE 5000
CMD [ "python3", "app.py"]
