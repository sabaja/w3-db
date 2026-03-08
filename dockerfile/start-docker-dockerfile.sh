#!/bin/bash

#Se riavvii il container non verrà rieseguito. Per forzare:
docker rm -f w3school-postgres
docker volume prune
echo 'Eliminato precedente container'

docker build -t w3school-postgres-img .

#Posizionarsi dove è presente il Dockerfile e avviae container:
docker run -d --name w3school-postgres  -p 5433:5433  w3school-postgres-img
echo 'Avvio...'

