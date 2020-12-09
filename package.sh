#!/bin/bash
path=`pwd`
docker build -t ahadeo/hello-world-python:0.0.1 $path/hello-world-python-code
docker login
docker push ahadeo/hello-world-python:0.0.1