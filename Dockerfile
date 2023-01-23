FROM python:3.9

COPY requirements.txt .
RUN pip install -r requirements.txt

CMD [ "python", "-m", "radicale", "--config", "config" ]
