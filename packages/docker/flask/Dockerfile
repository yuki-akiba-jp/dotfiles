FROM python:3


ENV FLASK_DEBUG=development

WORKDIR /app
COPY . .

RUN apt update && apt install -y sqlite3 vim less
RUN pip install -r requirements.txt


CMD [ "python", "setup.py" ]
