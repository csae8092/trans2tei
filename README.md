sudo docker build -t transtei .
sudo docker run -it --rm --env-file .env -v $PWD/TEI:/data/tei --name transtei transtei
