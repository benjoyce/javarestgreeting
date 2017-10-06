FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD target/greetingapi-*.jar app.jar
ENV JAVA_OPTS=""

ENTRYPOINT ["/usr/bin/java"]
CMD ["-jar", "app.jar"]
EXPOSE 8080