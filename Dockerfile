FROM python:3.10-alpine

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

EXPOSE 8000

CMD ["uvicorn", "shortz.main:app", "--host", "0.0.0.0", "--port", "8000"]
