# shortz
python URL shortener with sqlite.

Use this as a payload to build a web app that can be run on Kubernetes or Docker.

## To setup environment
```
python3 -m venv venv
source venv/bin/activate
python -m pip --version

pip install -r requirements.txt
```

This should create a local venv folder and install the requirements.

## To run
```
uvicorn shortz.main:app --reload
```
