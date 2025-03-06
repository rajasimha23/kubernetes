FROM python:3.12-alpine

WORKDIR /tutorial

COPY ./tutorial .

RUN pip install -e .

EXPOSE 5000

RUN flask --app flaskr init-db

CMD ["flask", "--app", "flaskr", "run", "--host=0.0.0.0"]


