FROM       centos:6
MAINTAINER layfolk
ARG        jver=7u80
ARG        tver1=7
ARG        tver2=0.85
ARG        user=tomuser
ARG        jhome=/usr/jdk
ENV        LANG      en_US.utf8
ENV        JAVA_HOME ${jhome}
RUN        ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
           rm -rf /root/* /tmp/* && \
           useradd ${user} && mkdir ${jhome} /home/${user}/tomcat && \
           chown ${user}.${user} /home/${user}/tomcat && \
           yum install -y wget && yum clean all && \
           wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" \
           -qO- "http://download.oracle.com/otn-pub/java/jdk/${jver}-b14/jdk-${jver}-linux-x64.tar.gz" | tar -zx --strip-components 1 -C ${jhome} && \
           wget -qO- "http://archive.apache.org/dist/tomcat/tomcat-${tver1}/v${tver1}.${tver2}/bin/apache-tomcat-${tver1}.${tver2}.tar.gz" | tar -zx --strip-components=1 -C /home/${user}/tomcat && \
           sed -i 's/<\(.*8009.*AJP.*\/\)>/<!-- \1 -->/g' /home/${user}/tomcat/conf/server.xml
USER       ${user}
WORKDIR    /home/${user}
EXPOSE     8080
ENTRYPOINT ["/home/${user}/tomcat/bin/catalina.sh", "run"]
