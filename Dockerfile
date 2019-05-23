FROM jenkins/jnlp-slave:3.27-1
MAINTAINER Apirath Promyan <gamez.apirath.promyan@gmail.com>
LABEL Description="This is an image, which provides the Jenkins agent executable with including docker, docker-compose, kubectl, Go, maven, node."

USER root

RUN apt-get update \
    && apt-get -y install apt-transport-https \
        ca-certificates \
        curl \
        gnupg2 \
        software-properties-common \
    && curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > \
        /tmp/dkey; apt-key add /tmp/dkey \
    && add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
        $(lsb_release -cs) \
        stable" \
    && apt-get update \
    && apt-get -y install docker-ce

RUN apt-get install -y docker-ce \
    && usermod -a -G docker jenkins

# USER jenkins
