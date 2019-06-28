FROM tomcat:9.0-jre8-alpine
COPY target/ui*.war $CATALINA_HOME/webapps/ui.war
HEALTHCHECK --interval=1m --timeout=3s CMD wget --quiet --tries=1 --spider http://localhost:8080/ui || exit 1
EXPOSE 8080
CMD chmod +x $CATALINA_HOME/bin/catalina.sh
CMD ["catalina.sh", "run"]