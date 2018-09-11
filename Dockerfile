# Demo site for docker
# Version 1.0

FROM centos:latest

RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm
RUN yum update -y
RUN yum install -y python3 python36u-libs python36u-devel python36u-pip
RUN yum install -y mysql-devel mysql-lib mysql-connector-python
RUN yum groupinstall 'Development Tools' -y

ARG PROJECT=dok
ARG PROJECT_DIR=/var/www/${PROJECT}

RUN mkdir -p ${PROJECT_DIR}
WORKDIR ${PROJECT_DIR}
COPY dok dok
COPY requirements.txt manage.py ./
RUN pip3.6 install -r requirements.txt
RUN python3.6 manage.py migrate

#Server
EXPOSE 8000:8000
STOPSIGNAL SIGINT
ENTRYPOINT ["python3.6", "manage.py"]
CMD ["runserver", "0.0.0.0:8000"]




