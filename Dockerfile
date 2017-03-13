# The above statement in the docker file defines the base image. 
# We are using a base image which gives us a debian kernel with java installed.
FROM java:openjdk-8-jdk

ENV spark_ver 2.1.0

# Get Spark from US Apache mirror.
RUN mkdir -p /opt && \
    cd /opt && \
    curl http://www.us.apache.org/dist/spark/spark-${spark_ver}/spark-${spark_ver}-bin-hadoop2.7.tgz | \
        tar -zx && \
    ln -s spark-${spark_ver}-bin-hadoop2.7 spark && \
    echo Spark ${spark_ver} installed in /opt


ADD start-common.sh start-worker.sh start-master.sh /
RUN chmod +x /start-common.sh /start-master.sh /start-worker.sh
ENV PATH $PATH:/opt/spark/bin
