#!/bin/bash
path=`pwd`
existeServicio=`helm get hello-world-python | grep -c "name"`
if [ $validateHelmService -gt 0 ]
    then
        helm upgrade hello-world-python $path/hello-world-python
	echo "entre al then"
    else
	echo "entre al else"    
        helm install hello-world-python $path/hello-world-python
    fi
