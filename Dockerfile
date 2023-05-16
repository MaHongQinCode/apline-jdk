FROM debian:stable-slim
COPY . /app
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    tar -zxvf /app/openjdk-8u42-b03-linux-x64-14_jul_2022.tar.gz -C /app && \
    rm -rf /app/openjdk-8u42-b03-linux-x64-14_jul_2022.tar.gz && \
    chmod +x /app/*.jar
ENV JAVA_HOME /app/java-se-8u42-ri
ENV PATH $JAVA_HOME/bin:$PATH
ENTRYPOINT ["java", "-jar", "-Dfile.encoding=UTF-8", "/app/syncserver.jar"]
