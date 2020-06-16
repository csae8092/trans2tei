docker build -t transtei .
docker run -it --rm --env-file .env -v $PWD/mets:/data/mets -v $PWD/tei:/data/tei -v $PWD/scripts:/data/scripts --name transtei transtei
