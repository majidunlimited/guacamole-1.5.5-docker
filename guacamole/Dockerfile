FROM tomcat:9.0-jdk17-temurin

ENV GUACAMOLE_HOME=/etc/guacamole

RUN rm -rf /usr/local/tomcat/webapps/* \
  && mkdir -p /etc/guacamole/extensions /etc/guacamole/lib

COPY ./guacamole-1.5.5.war /usr/local/tomcat/webapps/ROOT.war

COPY ./guacamole-auth-jdbc-mysql-1.5.3.jar /etc/guacamole/extensions/
COPY ./mysql-connector-j-8.3.0.jar /etc/guacamole/lib/

COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["catalina.sh","run"]

