# -------------------------------
# Stage 1: Build
# -------------------------------
FROM maven:3.9.14-eclipse-temurin-8 AS stage1

WORKDIR /home/app

# Copy only pom first (cache dependencies)
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source code
COPY src ./src

# Build jar
RUN mvn clean package -DskipTests

# -------------------------------
# Stage 2: Runtime
# -------------------------------
FROM eclipse-temurin:8-jdk-alpine

WORKDIR /app

# Copy built jar
COPY --from=stage1 /home/app/target/*.jar app.jar

EXPOSE 5000

ENTRYPOINT ["java", "-jar", "app.jar"]