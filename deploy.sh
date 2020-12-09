#!/bin/bash

path=`pwd`
existeServicio=`helm get hello-world-python| grep -c "name"`
if [ $existeServicio -gt 0 ]
then
helm upgrade hello-world-python $path/hello-world-python
else
helm install --name hello-world-python $path/hello-world-python 

fi