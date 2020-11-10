FROM python:3.7-slim

RUN apt update && apt install git -y
ADD . /
RUN pip install -r requirements.txt && \
    pip install -e . 
