FROM tomcat:8 
LABEL maintainer www.ctnrs.com
RUN rm -rf /usr/local/tomcat/webapps/*
ADD target/*.war /usr/local/tomcat/webapps/ROOT.war 
