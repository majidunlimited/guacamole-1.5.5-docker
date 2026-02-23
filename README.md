# guacamole-1.5.5-docker:
This is a docker-compose file which can build Apache-guacamole1.5.5 docker images. 
In this docker compose, we build 'guac-stack-guacamole' which use 'tomcat:9.0-jdk17-temurin' as a base image and contain guacamole client (.war) and tomcat.
Also we build 'guac-stack-guacd' which use 'Ubuntu:22.04' as a base image and contain guacamole-server.

# guacamole client:
Minimum needed jar files as extensions and lib files are in image. 

# guacamole server:
First we create a container as a builder to compile guacamole server. So in first container we install prerequisites which are needed for compile.
In second container we install prerequisites which are needed for guacamole-server and then copy files from first container (builder).

# Files Version:
Apache guacamole server 1.5.5
Apache guacamole client 1.5.5
Mysql 8.0
JDBC 1.5.3
