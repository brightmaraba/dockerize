FROM python:3.10-slim
LABEL maintainer="Brian Koech <brightkoech@gmail.com>"

ENV PYTHONBUFFERED 1

WORKDIR /code

COPY ./requirements.txt ./
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

COPY ./src ./src

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "80", "--reload"]