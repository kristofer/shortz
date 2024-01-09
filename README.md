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

## GEtting running on k3s

_hoo buoy, ja._

## Docker

Inside the Dockerfile, there is the specification to create the image that will be later deployed in the k3s cluster.

The Dockerfile is as follows:
```
FROM python:3.10-alpine
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python", "app.py"]
```
Build the image with: `docker build -t k3s-kubernetes-shortz .`
    
To run the image use `docker run k3s-kubernetes-shortz -p 5000:5050`.
The service will again be reachable at `http://localhost:5050`.

## k3s setup

If you have already set up your k3s cluster, you can skip this part, otherwise follow the steps described in the front page of the [k3s website](https://k3s.io/).

## Importing the image in k3s

Importing the image in k3s in one line and does not require saving the image:
```
docker save k3s-kubernetes-shortz | sudo k3s ctr images import -
```
## Deployment configuration

Now that the image has been built, it is time to configure the k3s deployment in
[the kubernetes deployment file](deployment.yaml).

You can start the service by applying the aforementioned configuration with `k3s kubectl apply -f deployment.yml`.
This will spin up three pods running the previously written Python application and a load balancer.
The latter can be reached at `http://localhost:8005`.
