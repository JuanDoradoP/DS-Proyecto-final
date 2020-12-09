#!/bin/bash
path=`pwd`
result=`docker run -v $path/hello-world-python-code:/app -w=/app --rm --name=srvtest python:alpine3.12 /bin/sh -c "pip install -r requirements_dev.txt; pytest -v"`
resultTest=$(echo $result | grep -c FAILED)
if [[ $resultTest -gt 0 ]]
    then
        exit;
    else 
	echo $path    
        echo "test ok"
        echo "Making package"
	docker build -t ahadeo/hello-world-python:0.0.1 $path/hello-world-python-code
        docker login
        docker push ahadeo/hello-world-python:0.0.1
	echo "Package ok."
	echo "Making deploy"
	existeServicio=`helm get hello-world-python| grep -c "name"`
        if [ $existeServicio -gt 0 ]
            then
                helm upgrade hello-world-python $path/hello-world-python
            else
                helm install --name hello-world-python $path/hello-world-python


            fi
        
	
    fi

