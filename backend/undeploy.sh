#!/bin/bash
## MyToDoReact version 1.0.


echo delete frontend deployment and service...

kubectl -n mtdrworkshop delete deployment todolistapp-helidon-se-deployment 
kubectl -n mtdrworkshop delete service todolistapp-helidon-se-service
