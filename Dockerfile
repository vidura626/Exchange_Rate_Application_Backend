#FROM openjdk:21
#ARG JAR_FILE=target/*.jar
#COPY ./target/exchange-rate-application-0.0.1-SNAPSHOT.jar app.jar
#ENTRYPOINT ["java","-jar","/app.jar"]
#EXPOSE 8085

# Stage 1: Build the application using Maven and Java 21
FROM maven:3.9.2-eclipse-temurin-21 AS build
WORKDIR /app

# Copy the pom.xml and project files to the container
COPY pom.xml .
COPY src ./src

# Build the application and package it into a JAR file, skipping tests
RUN mvn clean package -DskipTests

# Stage 2: Run the application using OpenJDK 21
FROM openjdk:21
WORKDIR /app

# Copy the JAR file from the previous build stage
COPY --from=build /app/target/exchange-rate-application-0.0.1-SNAPSHOT.jar app.jar

# Expose the port the application will run on
EXPOSE 8085

# Set the entry point for the application
ENTRYPOINT ["java", "-jar", "/app.jar"]
