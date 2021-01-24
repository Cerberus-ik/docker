FROM ubuntu:18.04

EXPOSE 8080 8081 8082 443

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install wget gnupg dialog apt-utils -y

RUN wget -qO - https://releases.jfrog.io/artifactory/api/gpg/key/public | apt-key add -;
RUN echo "deb https://releases.jfrog.io/artifactory/artifactory-debs bionic main" | tee -a /etc/apt/sources.list; 
RUN apt-get update && apt-get install jfrog-artifactory-oss -y

ADD start.sh /
RUN chmod +x /start.sh 

#RUN service artifactory check
RUN chown -R artifactory:artifactory /opt/jfrog/artifactory/var/log

RUN mkdir -p $JFROG_HOME/artifactory/var/etc/
RUN cd $JFROG_HOME/artifactory/var/etc/
RUN touch ./system.yaml
RUN chown -R $UID:$GID $JFROG_HOME/artifactory/var
RUN chmod -R 777 $JFROG_HOME/artifactory/var

CMD [ "/start.sh" ]