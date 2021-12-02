FROM mcr.microsoft.com/dotnet/sdk:6.0

LABEL Author="elio@elio.eti.br"

ARG NUGET_XMLDOC_MODE=""
ARG TZ=""

ENV TZ=${TZ:-"US/Central"}
ENV ASPNETCORE_URLS="http://*"
ENV DOTNET_HOME=/root/.dotnet
ENV DOTNET_TOOLS=/root/.dotnet/tools
ENV NUGET_XMLDOC_MODE=${NUGET_XMLDOC_MODE:-"none"}
ENV WORKSPACE=/app
ENV PATH="PATH=${PATH}:$HOME/.local/bin:${DOTNET_HOME}:${DOTNET_TOOLS}"

COPY bash_files/. /root/.

RUN mkdir -p {$HOME/.local/bin}\
 && export ${PATH}\
 && export DOTNET_HOME=${DOTNET_HOME}\
 && export DOTNET_TOOLS=${DOTNET_TOOLS}\
 && export TZ=${TZ}\
 && apt-get update\
 && apt-get upgrade -y\
 && apt-get install -y curl wget git software-properties-common gnupg apt-transport-https tree python3 python3-pip jq tree exiftool dos2unix openjdk-11-jre\
 && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg\
 && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null\
 && wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O /tmp/packages-microsoft-prod.deb\
 && dpkg -i /tmp/packages-microsoft-prod.deb\
 && rm /tmp/packages-microsoft-prod.deb\
 && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -\
 && sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-buster-prod buster main" > /etc/apt/sources.list.d/microsoft.list'\
 && apt-get update\
 && apt-get upgrade -y\
 && apt-get install -y powershell dotnet-sdk-3.1 dotnet-sdk-5.0\
 && apt-get install -y docker-ce docker-ce-cli containerd.io\
 && rm -rf /var/lib/apt/lists/*\
 && ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone\
 && pip install --upgrade pip\
 && pip install https://github.com/hay/xml2json/zipball/master anchorecli\
 && dotnet tool install --global GitVersion.Tool\
 && dotnet tool install --global dotnet-sonarscanner\
 && dotnet tool install --global dotnet-reportgenerator-globaltool\
 && dotnet tool install --global coverlet.console\
 && dotnet tool install --global trx2junit

WORKDIR ${WORKSPACE}

