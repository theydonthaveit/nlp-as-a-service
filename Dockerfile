FROM python:3.7-alpine

RUN adduser -D nlp-server

WORKDIR /home/nlp-server

COPY requirements.txt requirements.txt
RUN python -m venv venv
RUN venv/bin/pip install --upgrade pip
RUN venv/bin/pip install -r requirements.txt
RUN venv/bin/pip install gunicorn

COPY app app
COPY server.py .env boot.sh ./
RUN chmod +x boot.sh

ENV FLASK_APP server.py

RUN chown -R nlp-server:nlp-server ./
USER nlp-server

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]