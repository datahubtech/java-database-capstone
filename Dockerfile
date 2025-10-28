# Step 1: Use Maven with JDK 17 to build the app
FROM maven:3.9.9-eclipse-temurin-17 AS builder

# WORKDIR /app section
WORKDIR /app

# pom.xml section
COPY pom.xml .

# src ./src section
COPY src ./src

# RUN section
RUN mvn clean package -DskipTests

# Step 2: Use lightweight JRE 17 for running the app
FROM eclipse-temurin:17.0.15_6-jre

# WORKDIR /app section
WORKDIR /app

# from=builder section
COPY --from=builder /app/target/back-end-0.0.1-SNAPSHOT.jar app.jar

# Port section
EXPOSE 8080

# ENTRYPOINT section
ENTRYPOINT ["java", "-jar", "app.jar"]
