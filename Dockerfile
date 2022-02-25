FROM ubuntu:20.04
RUN apt-get update && apt-get -y install vim && DEBIAN_FRONTEND='noninteractive' apt-get -y install r-base && apt-get -y install openjdk-8-jdk
ENV LD_LIBRARY_PATH=/usr/lib/jvm/java-8-openjdk-amd64/lib/amd64:/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/server
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre JAVA=/usr/bin/java JAVAC=/usr/bin/javac JAVAH=/usr/bin/javah JAR=/usr/bin/jar JAVA_LD_LIBRARY_PATH=/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/server JAVA_LIBS="-L/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/server -ljvm" JAVA_CPPFLAGS="-I/usr/lib/jvm/java-8-openjdk-amd64/jre/../include -I/usr/lib/jvm/java-8-openjdk-amd64/jre/../include/linux"
RUN R -e "install.packages('rJava')" && R -e "install.packages('RJDBC')"
COPY . /scripts/
