FROM gradle:jdk11 as builder

RUN mkdir /home/gradle/project

WORKDIR /home/gradle/project

USER root

COPY . /home/gradle/project

RUN gradle build


FROM openjdk:11.0.3-jre-slim

EXPOSE 8080

WORKDIR /home/gradle/project

COPY --from=builder /home/gradle/project/build/libs/spring-events.jar .

ENTRYPOINT java -jar spring-events.jar
