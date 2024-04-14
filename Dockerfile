FROM python:3.10-alpine

RUN apk update
RUN apk add git

COPY requirements.txt .
RUN pip install -r requirements.txt

CMD [ "python", "-m", "radicale", "--config", "config" ]
