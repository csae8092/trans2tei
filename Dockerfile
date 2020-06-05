# Dockerfile
# https://semaphoreci.com/community/tutorials/dockerizing-a-python-django-web-application
# chmod 755 start-server.sh
FROM python:3.6-buster

USER root

RUN apt-get update && apt-get install vim git  openjdk-11-jre-headless ant -y --no-install-recommends
RUN pip install requests lxml json2xml

WORKDIR /data
RUN wget https://sourceforge.net/projects/saxon/files/Saxon-HE/9.9/SaxonHE9-9-1-7J.zip/download && unzip download -d saxon && rm -rf download
RUN git clone --depth=1 --branch master --single-branch https://github.com/Transkribus/TranskribusPyClient.git
RUN git clone --depth=1 --branch dev --single-branch https://github.com/TEIC/Stylesheets.git
COPY . .
CMD ["bash"]
