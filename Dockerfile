#
# Build stage
#
FROM maven:3.8-openjdk-17 AS build
COPY pom.xml /home/app/pom.xml
RUN mvn --quiet -f /home/app/pom.xml clean -P docker
WORKDIR /home/app
RUN mvn --quiet dependency:resolve -Dsilent=true -U
RUN mvn --quiet dependency:resolve-plugins -Dsilent=true -U
COPY src /home/app/src
RUN mvn --quiet -DskipTests -f /home/app/pom.xml package -P docker

#
# Package stage
#
FROM openjdk:18-slim-buster
RUN apt-get update && apt-get install -y curl
COPY --from=build /home/app/target/*.jar /usr/local/lib/app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/app.jar"]