to build

docker build -t nlp-service .

to run

docker run --name nlp-service -d -p 8000:5000 -v ~/.workdir/kiroku-nlp-service/model:/model --rm nlp-service:latest
