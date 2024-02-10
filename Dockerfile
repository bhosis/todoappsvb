# Use an official OpenJDK runtime image as the base image
FROM openjdk:11-jre-slim
# Set the working directory inside the container
WORKDIR /app
# Copy the Spring Boot JAR from the build stage into the container
COPY ./target/*.jar app.jar
# Expose the port that the Spring Boot app will listen on
EXPOSE 8081
# Specify the command to run the Spring Boot app when the container starts
CMD ["java", "-jar", "app.jar"]
