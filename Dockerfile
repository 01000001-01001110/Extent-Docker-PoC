FROM jenkins/jenkins:lts

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

USER root

ARG USER_GID
ARG USER_ID

# Check that the USER_GID argument is set
RUN if [ -z "$USER_GID" ]; then echo "USER_GID argument is not set"; exit 1; fi

# Check that the USER_ID argument is set
RUN if [ -z "$USER_ID" ]; then echo "USER_ID argument is not set"; exit 1; fi

# Update the jenkins user ID and group ID
RUN usermod -u ${USER_ID} jenkins \
    && groupmod -g ${USER_GID} jenkins \
    && chown -R jenkins:jenkins ${JENKINS_HOME}

# install docker commandline interface and its dependencies
RUN apt update && apt install -y lsb-release \
    software-properties-common \
    jq \
    apt-utils \
    apt-transport-https \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] \
    https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
    && apt update && apt install -y docker-ce-cli \
    && rm -rf /var/lib/apt/lists/*

USER jenkins

# copy plugins.txt to the $REF/init.groovy.d directory
# that is already set up by the base jenkins image
COPY plugins.txt ${REF}/init.groovy.d/plugins.txt

USER root

# install all plugins listed up there
RUN jenkins-plugin-cli -f ${REF}/init.groovy.d/plugins.txt

USER jenkins

WORKDIR $JENKINS_HOME
