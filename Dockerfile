FROM openjdk:17-alpine
LABEL Maintainer=https://github.com/sgs-turbo23

COPY command.sh /command.sh
RUN apk update \
    && apk upgrade \
    && apk add wget git \
    && chmod 744 /command.sh \
    && mkdir /spigot \
    && mkdir /bind
WORKDIR /spigot
RUN wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
CMD ["ash", "/command.sh"]