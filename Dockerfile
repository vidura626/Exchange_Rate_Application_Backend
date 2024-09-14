#FROM openjdk:21
#ARG JAR_FILE=target/*.jar
#COPY ./target/exchange-rate-application-0.0.1-SNAPSHOT.jar app.jar
#ENTRYPOINT ["java","-jar","/app.jar"]
#EXPOSE 8085
# Stage 1: Build the application
FROM maven:3.8.6-openjdk-21 AS build
WORKDIR /app

# Copy the pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the source code and build the application
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Create the final image with the JAR file
FROM openjdk:21-jdk-slim
WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=build /app/target/exchange-rate-application-0.0.1-SNAPSHOT.jar /app/app.jar

# Expose the application's port
EXPOSE 8085

# Run the application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
