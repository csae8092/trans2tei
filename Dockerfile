# Dockerfile
# https://semaphoreci.com/community/tutorials/dockerizing-a-python-django-web-application
# chmod 755 start-server.sh
FROM python:3.6-buster

USER root

RUN apt-get update && apt-get install vim git  openjdk-11-jre-headless ant -y --no-install-recommends
RUN pip install acdh-transkribus-utils

WORKDIR /data
RUN wget https://sourceforge.net/projects/saxon/files/Saxon-HE/9.9/SaxonHE9-9-1-7J.zip/download && unzip download -d saxon && rm -rf download
RUN git clone --depth=1 --branch skurzinz-patch-1 --single-branch https://github.com/skurzinz/page2tei.git
RUN git clone --depth=1 --branch dev --single-branch https://github.com/TEIC/Stylesheets.git
COPY scripts /data/scripts
CMD ["bash"]
