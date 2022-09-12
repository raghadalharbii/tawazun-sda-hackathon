FROM maven:3.8.6-openjdk-11
ENV DB_URL=mysql
ENV DB_NAME=Tawazun
ENV DB_USERNAME=root
ENV DB_PASSWORD=DevOps222
ENV DB_PORT=3306
WORKDIR /app
ADD pom.xml .
RUN ["/usr/local/bin/mvn-entrypoint.sh", "mvn", "verify", "clean", "--fail-never"]
COPY . .
RUN mvn package
EXPOSE 8080
ENTRYPOINT ["java","-jar","./target/tawazun.war"]