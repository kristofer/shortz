# shortz
python URL shortener with sqlite.

Use this as a payload to build a web app that can be run on Kubernetes or Docker.

## To setup environment
```
python3 -m venv venv
source venv/bin/activate
python -m pip --version

python -m pip install fastapi==0.75.0 uvicorn==0.17.6
python -m pip install sqlalchemy==1.4.32
python -m pip install python-dotenv==0.19.2
python -m pip install validators==0.18.2
```

## To run
```
uvicorn shortz.main:app --reload
```
