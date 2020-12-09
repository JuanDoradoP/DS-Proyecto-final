#!/bin/bash

result=`docker run -v $path/hello-world-python-code:/app -w=/app --rm --name=srvtest python:alpine3.12 /bin/sh -c "pip install -r requirements_dev.txt; pytest -v"`
resultTest=$(echo $result | grep -c FAILED)
if [[ $resultTest -gt 0 ]]
    then
        exit;
    else 
        echo "test ok"
    fi

