FROM gradle:jdk11

WORKDIR /home/gradle/project

EXPOSE 8080

USER root

ENV GRADLE_USER_HOME /home/gradle/project

COPY . /home/gradle/project

RUN gradle build


FROM openjdk:11.0.3-jre-slim

WORKDIR /home/gradle/project

COPY --from=0 /home/gradle/project/build/libs/spring-events.jar .

ENTRYPOINT java -jar spring-events.jar
