FROM smpurkis/python-firefox-geckodriver-alpine:latest

WORKDIR /app
COPY ./ ./
RUN pip install -r requirements.txt && \
    rm -rf /.cache/pip

CMD ["python", "main.py"]