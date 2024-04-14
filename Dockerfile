FROM python:3.10-slim

COPY requirements.txt .
RUN pip install -r requirements.txt

CMD [ "python", "-m", "radicale", "--config", "config" ]
