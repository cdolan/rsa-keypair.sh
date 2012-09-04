# rsa-keypair.sh

Simplifies generating an RSA key pair.

## Examples

The simpliest example:

`sh ./rsa-keypair.sh mykey`

If you want a really strong key:

`sh ./rsa-keypair.sh -b 4096 mykey`

To generate a key with an X509 certificate:

`sh ./rsa-keypair.sh -c mykey`

## Usage
<pre>
usage: sh ./rsa-keypair.sh [options] keyname

Simplifies generating an RSA key pair.

OPTIONS
  -h    This usage information
  -b    Bit length, defaults to 2048
  -c    Generate associated X509 certificate
  -e    Change certificate expiration, defaults to 365 days
</pre>