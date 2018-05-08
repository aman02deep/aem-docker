FROM centos:7

MAINTAINER aman

RUN yum -y update
RUN yum -y install java-1.8.0-openjdk

# Copies required build media
ADD resources/cq-quickstart-6.3.0.jar /opt/aem/cq-quickstart-6.3.0.jar
ADD resources/license.properties /opt/aem/license.properties

# Extracts AEM
WORKDIR /opt/aem
RUN java -XX:MaxPermSize=256m -Xmx1024M -jar cq-quickstart-6.3.0.jar -unpack -r nosamplecontent

#create install folder
RUN mkdir crx-quickstart/install

# Copy other packages in install folder
ADD resources/packages/ crx-quickstart/install

EXPOSE 4502
CMD crx-quickstart/bin/quickstart