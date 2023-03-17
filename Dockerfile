FROM python:3.10.5-alpine

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Fix for libexpat vulnerability
RUN apk add --no-cache expat-dev && \
    apk add --no-cache expat-dev libxml2-dev libxslt-dev && \
    apk add --no-cache --virtual .build-deps gcc musl-dev && \
    pip install --upgrade lxml==4.6.3 && \
    apk del .build-deps

# Fix for OpenSSL vulnerability
RUN apk add --no-cache rust && \
    apk add --no-cache openssl-dev && \
    apk add --no-cache --virtual .build-deps build-base libffi-dev && \
    ENV RUSTFLAGS="-C target-feature=-crt-static" && \
    pip install cryptography==3.4.7 && \
    apk del .build-deps

WORKDIR /code

# Add project files to the code/ folder
ADD ./ .

# Install dependencies and fix zlib
RUN apk --no-cache add zlib-dev && \
    pip install -r requirements.txt

# Define the default port
EXPOSE 8000

# Setup executable command in the container
CMD python manage.py runserver 0.0.0.0:8000