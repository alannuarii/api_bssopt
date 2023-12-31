FROM python:3.12.0-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

ARG DB_HOST
ARG DB_USER
ARG DB_PASSWORD
ARG DB_NAME
ARG DB_PORT
ARG SECRET_KEY
ENV FLASK_APP=server.py
ENV DB_HOST=$DB_HOST
ENV DB_USER=$DB_USER
ENV DB_PASSWORD=$DB_PASSWORD
ENV DB_NAME=$DB_NAME
ENV DB_PORT=$DB_PORT
ENV SECRET_KEY=$SECRET_KEY

CMD ["flask", "run", "--host=0.0.0.0"]

EXPOSE 5000