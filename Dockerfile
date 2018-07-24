FROM amazonlinux:latest
MAINTAINER rgurug007@icloud.com
# Gather some info and update linux
RUN yum -y update \
    yum install curl -y 
# Now lets install nvm,npm and express
RUN yum install tar -y \ 
&& yum install gzip -y \
&& curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash \
&& chmod +x ~/.nvm/nvm.sh \
&& ls -ltr ~/.nvm/nvm.sh \
&& ~/.nvm/nvm.sh \
&& export NVM_DIR="$HOME/.nvm" \
&& echo NVM DIR is $NVM_DIR \
&& [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" \
&& [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" \
&& nvm install --lts \
&& npm install express \
# Verify installation
&& echo node,npm,nvm version \
&& node --version \
&& npm --version \
&& nvm --version 
# Lets install nginx
RUN yum install -y sudo yum install –y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
&& yum install -y epel-release \
&& yum install -y yum-utils \
&& yum-config-manager --enable epel \
&& yum repolist \
&& yum install nginx -y \
&& yum -y install initscripts \
&& yum clean all 

EXPOSE 80 8080

CMD ["nginx", "-g", "daemon off;"]


#&& service nginx status 


## copy nginx configuration


