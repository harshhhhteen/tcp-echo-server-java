FROM openjdk:8
WORKDIR /usr/src/app
COPY target/echoserver.jar /usr/src/app/
CMD "java -jar echoserver.jar"
