FROM ubuntu:16.04

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt
COPY ./gunicorn.conf /app/gunicorn.conf

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

EXPOSE 5000

CMD [ "gunicorn", "--config", "/app/gunicorn.conf",  "snakeeyes.app:create_app()"]

# docker build -t python-snakeeyes .
# docker run -d -p 5000:5000 python-snakeeyes --> localhost:5000