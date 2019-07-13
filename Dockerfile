FROM tomcat:9.0.22
COPY /target/*.war /usr/local/tomcat/webapps/naveena.war
