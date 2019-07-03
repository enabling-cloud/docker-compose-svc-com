FROM tomcat:9.0-jre8-alpine
COPY target/date-service*.war $CATALINA_HOME/webapps/date-service.war
COPY etc/setenv.sh $CATALINA_HOME/bin/setenv.sh
HEALTHCHECK --interval=1m --timeout=3s CMD wget --quiet --tries=1 --spider http://localhost:8080/date-service || exit 1
EXPOSE 8080
CMD chmod +x $CATALINA_HOME/bin/catalina.sh
CMD ["catalina.sh", "run"]