mkdir -p ca
# CA
openssl genrsa -out ca/CAKey.pem 4096
openssl req -x509 -new -key ca/CAKey.pem -sha512 -days 365 -out ca/CACert.pem -subj '/CN=rabbitmq CA/O=RabbitMQ certgen.sh'