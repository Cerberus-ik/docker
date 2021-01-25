FROM ubuntu:20.04

EXPOSE 1024

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install python3-pip wget apt-utils unzip dirmngr gnupg apt-transport-https ca-certificates software-properties-common libcurl4-openssl-dev libssl-dev build-essential librtmp-dev libmysqlclient-dev tk-dev libncurses5-dev libncursesw5-dev libreadline6-dev libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev -y

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN apt-add-repository 'deb https://download.mono-project.com/repo/ubuntu stable-focal main'
RUN apt install mono-complete -y
RUN mono --version

RUN mkdir -p /var/opt/mfbot/webinterface

RUN wget https://www.mfbot.de/Download/latest/MFBot_Konsole_x86_64 -P /var/opt/mfbot
RUN chmod +x /var/opt/mfbot/MFBot_Konsole_x86_64

RUN cd /var/opt/mfbot/webinterface
RUN wget https://www.mfbot.de/Download/v5.0.0.4/mfbot-webinterface.zip -P /var/opt/mfbot/webinterface
RUN unzip /var/opt/mfbot/webinterface/mfbot-webinterface.zip -d /var/opt/mfbot/webinterface
RUN pip3 install -r /var/opt/mfbot/webinterface/requirements.txt 
#RUN pip3 install dash-core-components
RUN rm /var/opt/mfbot/webinterface/mfbot-webinterface.zip

ADD start.sh /var/opt/mfbot
RUN chmod +x /var/opt/mfbot/start.sh 

CMD [ "/var/opt/mfbot/start.sh" ]