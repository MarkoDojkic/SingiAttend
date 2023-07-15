The teacher's application for student attendance represents an expanded "ISEPS" project to be used with coresponding Android and iPhone applications for students. Additionally, a Spring REST server is added for communication, and the database is updated.
Note: This is not an official Singidunum University application.


The structure of the project is as follows:
1. A web application used by professors, assistants, and system administrators that is made using PHP, HTML, CSS, and JavaScript technologies.
2. A mobile student application for the Android operating system, which was created in Android Studio using Java (https://github.com/MarkoDojkic/SingiAttend-Android).
3. A mobile student application for the iOS operating system, which was created in the xCode tool using Swift (https://github.com/MarkoDojkic/SingiAttend-iOS).
4. A backend server written in Java that uses the Spring framework and acts as an intermediary between client applications and the database
5. A MongoDB database that stores all necessary data and parameters for logging on to client applications


The server can be run from a Docker container after being built using the provided Docker file.
For mobile apps, it's needed to provide an appropriate url with port 62812 pointing to docker port 62812 (i.e., BE Spring server port).

Kubernates deployment:

run command: kubectl create deploy singiattend --image madojkic/main:singiattend-v2.4.6 -r=1 
(r = number of replica pods)

start services: kubectl apply -f services.yaml

port forward in background:

kubectl port-forward service/singiattend-services 62810:8080 & - FE  
kubectl port-forward service/singiattend-services 62812:62812 & - BE  
kubectl port-forward service/singiattend-services 62811:27017 & - MongoDB