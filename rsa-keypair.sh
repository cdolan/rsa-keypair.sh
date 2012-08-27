#!/bin/sh

OPENSSL=openssl
KEYLEN=2048
KEYNAME=

function usage {
  cat << EOF
  usage: $0 options
  
  Simplifies generating an RSA key pair.
  
  OPTIONS
    -o    Key name
    -b    Bit length, defaults to 2048
EOF
}

while getopts "ho:b:" OPTION
do
  case $OPTION in
    h)
      usage
      exit 1
      ;;
    o)
      KEYNAME=$OPTARG
      ;;
    b)
      KEYLEN=$OPTARG
      ;;
    ?)
      usage
      exit 1
      ;;
  esac
done

if [ -z $KEYNAME ]
then
  usage
  exit 1
fi

$OPENSSL genrsa -out $KEYNAME.pem $KEYLEN
$OPENSSL rsa -in $KEYNAME.pem -pubout > $KEYNAME.pub

exit