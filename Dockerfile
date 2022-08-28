FROM python:3.9-alpine

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.35-r0/glibc-2.35-r0.apk && \ 
    apk update && \ 
    apk add glibc-2.35-r0.apk --no-cache && \
    rm glibc-2.35-r0.apk

RUN apk update && \
    apk add xvfb firefox --no-cache

RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.31.0/geckodriver-v0.31.0-linux64.tar.gz && \
    tar -zxf geckodriver-v0.31.0-linux64.tar.gz -C /usr/bin && \
    rm geckodriver-v0.31.0-linux64.tar.gz

WORKDIR /app
COPY ./ ./
RUN pip install -r requirements.txt && \
    rm -rf /.cache/pip

CMD ["python", "main.py"]