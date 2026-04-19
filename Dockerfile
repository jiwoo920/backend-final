FROM eclipse-temurin:21-jdk AS build

WORKDIR /app

COPY gradlew settings.gradle build.gradle ./
COPY gradle ./gradle
RUN chmod +x ./gradlew

COPY src ./src
RUN ./gradlew bootJar --no-daemon

FROM eclipse-temurin:21-jre

WORKDIR /app
COPY --from=build /app/build/libs/*.jar app.jar
COPY start.sh ./start.sh
RUN chmod +x ./start.sh

ENV PORT=8080
EXPOSE 8080

CMD ["./start.sh"]
