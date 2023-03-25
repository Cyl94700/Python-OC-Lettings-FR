FROM python:3.10.5-alpine

ARG SECRET_KEY

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PORT=8000
ENV SECRET_KEY=$SECRET_KEY

WORKDIR /code

# Add project files to the code/ folder
ADD ./ .

# Install dependencies and fix zlib
RUN apk --no-cache add zlib-dev && \
    pip install -r requirements.txt

# Define the default port
EXPOSE $PORT

# Setup executable command in the container
CMD python manage.py runserver 0.0.0.0:$PORT