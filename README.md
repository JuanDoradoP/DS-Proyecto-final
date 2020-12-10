# Proyecto final - Sistemas distribuidos 2020-2

## Integrantes

Juan David Paz 

Juan Camilo Calvo

Jefferson Lerma


## Tecnologias usadas 

 - Kubernetes
 - Docker
 - Pytest
 - Helm
 - Bash

## Objetivo 

Esta prueba debe demostrar la creación de un servicio simple y la automatización necesaria para empaquetarlo e implementarlo en un clúster de Kubernetes


## Descripción general 

Este es el repositorio correspondiente al proyecto final de sistemas distribuidos. Lo primero que se realizó fue la construcción de una aplicación REST en python. Posteriormente se construyo la imagen de dicha aplicación por medio de la herramienta docker. Y por ultimo a través de un script que busca automatizar todo el despliegue de la aplicación, para esto usamos helm que permite empaquetar y desplegar la aplicación solo sí el código de la aplicación pasa una prueba unitaria sencilla usando Pytest. 


## Aplicación REST

Para el desarrollo de la aplicación REST se uso el ejemplo definido en el [training kubernetes](https://github.com/icesi-ops/training_kubernetes/tree/master/04_helm), Es importante recalcar que en este repositorio también se encuentra el test que se realiza por medio de Pytest, que permite realizar una prueba sobre la respuesta a una petición HTTP. Se tomo la decisión de usar los archivos de este training, pues ya se habría trabajado en clase y nos facilitaba la resolución del problema. 

### Descripción de la aplicación 
En este repositorio podrás encontrar 2 carpetas; hello-world-phyton que contiene los parámetros necesarios para la construcción del chart especificado en el archivo Chart.yml.  En el archivo values.yml se encuentran las variables para la construcción del deployment de la siguiente manera:
 
    image: icesiops/hello-world-python:0.0.1
    port: 5000
    servicetype: NodePort
    replicas: 2
    name: hello-world-python
    ingressname: gateway-ingress

Estas variables son llamadas en el archivo microservice-deployment.yaml que se encuentra dentro de la carpeta templates. En este archivo se construye el deployment y los pods, ademas de los servicios necesarios para desplegar y correr la aplicación. En el archivo ingress.yml se encuentran las configuraciones necesarias para administrar el acceso externo a los servidores de nuestro cluster.

En la hello-world-python-code se encuentrar los recursos necesarios para la contrucion de nuestra aplicacion en phyton, ademas del test de la aplicacion y el Dockerfile que construye la imagen de nuestra solucion.

## Script de automatización

En este script se buscaba automatizar la construcción y despliegue de la aplicación.

En la primera parte de la aplicación se verifica por medio de una variable que el test que se tiene en la aplicación python esta respondiendo. De acuerdo a esta variable se usa un if para definir si el script sigue corriendo o no.

Sí el test falla, el script se detiene. Sí el test pasa, se continua con el proceso.

Lo segundo se que realiza, es el empaquetado. Esto es simplemente contruir la imagen de la aplicación por medio de docker, y pushearla al docker hub. En este proyecto se utilizo el docker hub de Jefferson Lerma. 

Por ultimo, se realizo el despliegue en kubernetes, usando la herramienta helm. Aquí se realiza una verificación sobre la existencia del servicio. Sí existe, se usa el comando helm upgrade par actualizar el servicio. Sí no existe, se usa el comando el helm install para correr el servicio. 

## Ejecución de la aplicación

### prerrequisitos para la ejecución.


 - IDE o en su defecto posibilidad de ejecutar aplicaciones basadas en python.
 - Docker
 - Docker hub
 - Helm
 - Kubernettes


### Pasos para la ejecución.
 
 
 1. Descargar este [repositorio](https://github.com/JuanDoradoP/DS-Proyecto-final.git).
 2. Una vez descargado el repositorio, buscamos el archivo test.sh y le damos los permisos necesarios para su ejecución, así:
 
    `sudo chmod +x test.sh`
 
 3. Finalmente ejecutamos el script de la siguiente manera:
 
    `./test.sh`
 
 4. Finalmente comprobamos la correcta ejecución de nuestra aplicación mediante el comando:`kubectl get svc,po,deploy`, el cual nos muestra los servicios, los pods y el deploy creado. En este se encuentra la dirección ip publica con la cual podremos acceder a nuestra aplicación.
 
 

## Problemas encontrados y conclusión

A lo largo del desarrollo del proyecto nos encontramos principalmente con dos problemas:
 - Integración de los 3 Scripts que ejecutan nuestra aplicación: Inicialmente había decidido crear 3 Scripts (uno por cada paso esencial para del despliegue), sin embargo, al momento de integrarlos, la ejecución tenia errores inesperados. La solución a este problema fue dejar todo en un solo Script.
 - Mal uso de los recursos de la consola de google cloud: debido a nuestra inexperiencia se dejaron los cluster encendidos y consumiendo. Esto genero que tuviéramos que migrar toda la configuración de una consola a otra. también tuvimos algunos problemas con el manejo de la consola, en el sentido de que esta se quedaba congelada.
## Mejoras para la aplicacion
 - Una aplicación para producción contaría con mas componentes, como bases de datos, seguridad etc. En este sentido seria necesario hacer pruebas mas exhaustivas que corroboraran el correcto funcionamiento.
 - Con mas tiempo, podríamos hace uso de un framework para la creación del backend, y así tener una aplicación mas desacoplada que pueda escalar con facilidad.
 
