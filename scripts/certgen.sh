while getopts c:o:n: flag
do
    case "${flag}" in
        c) c=${OPTARG};;
        o) o=${OPTARG};;
        n) n=${OPTARG};;
    esac
done

echo "/c=${c}/O=${o}"
echo "file prefix = ${n}"

openssl genrsa -out "${n}Key.pem" 4096
openssl req -new -key "${n}Key.pem" -out "${n}.csr" -subj "/CN=${c}/O=${o}"
openssl x509 -req -sha512 -days 365 -in "${n}.csr" -CA ca/CACert.pem -CAkey ca/CAKey.pem -CAcreateserial -out "${n}Cert.pem"