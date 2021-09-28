FROM ubuntu:latest

COPY . /usr/script/
WORKDIR /usr/spigot/
RUN mkdir -p /usr/java/oracle && cd /usr/java/oracle \
    && apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install wget git \
    && wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/16.0.1+9/7147401fd7354114ac51ef3e1328291f/jdk-16.0.1_linux-x64_bin.tar.gz \
    && tar -xzf jdk-16.0.1_linux-x64_bin.tar.gz
ENV JAVA_HOME=/usr/java/oracle/jdk-16.0.1
ENV PATH=$PATH:$HOME/bin:$JAVA_HOME/bin
RUN cd /usr/spigot/ \
    && wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
CMD /usr/script/command.sh