#!/bin/bash
#no lanzar el .jar hasta que no esté accesible el servicio de MongoDB
#el host ‘mongo’ tendrá una IP otorgada al lanzar la pila de #servicios, y le damos
el apodo ‘mongo’, utilizado aquí y en el #archivo application.properties

While ! curl http://mongo:27017/
do
 echo "$(date) - still trying"
 sleep 1
done
echo "$(date) - it seems mongo server is connected successfully"
java -jar usr/local/app/ordering-service-0.1.0.jar \\
	 -spring.config.location=application.properties # o *.jar
