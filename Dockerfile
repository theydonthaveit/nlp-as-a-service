FROM python:3
RUN adduser --disabled-login nlp-server

WORKDIR /home/nlp-server

COPY requirements.txt requirements.txt
RUN python -m venv venv
RUN venv/bin/pip install --upgrade pip
RUN venv/bin/pip install --upgrade setuptools
RUN venv/bin/pip install -r requirements.txt
RUN venv/bin/pip install gunicorn
RUN mkdir scripts

COPY app app
COPY scripts/load_nlp_models.py scripts/.
COPY server.py boot.sh .env ./
RUN chmod +x boot.sh

ENV FLASK_APP server.py

RUN chown -R nlp-server:nlp-server ./
USER nlp-server

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]