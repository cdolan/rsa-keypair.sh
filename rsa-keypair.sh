#!/usr/bin/env bash

OPENSSL=openssl
KEYLEN=2048
KEYNAME=
CERT=
EXPIRE=365

function usage {
  cat << EOF
  usage: $0 [options] keyname
  
  Simplifies generating an RSA key pair.
  
  OPTIONS
    -h    This usage information
    -b    Bit length, defaults to 2048
    -c    Generate associated X509 certificate
    -e    Change certificate expiration, defaults to 365 days
EOF
}

while getopts "hb:ce:" OPTION; do
  case $OPTION in
    h) usage ; exit 1   ;;
    b) KEYLEN=$OPTARG   ;;
    c) CERT=1           ;;
    e) EXPIRE=$OPTARG   ;;
    ?) usage ; exit 1   ;;
  esac
done

shift $(($OPTIND - 1))
KEYNAME=$@

if [ -z $KEYNAME ]; then
  usage
  exit 1
fi

$OPENSSL genrsa -out $KEYNAME.pem $KEYLEN
$OPENSSL rsa -in $KEYNAME.pem -pubout > $KEYNAME.pub

if [ $CERT ]; then
  $OPENSSL req -new -x509 -key $KEYNAME.pem -out $KEYNAME.cert.pem -days $EXPIRE
fi

exit
