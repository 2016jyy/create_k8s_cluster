
mkdir -p ~/ikube/tls
echo """
[req] 
distinguished_name = req_distinguished_name
prompt = yes

[ req_distinguished_name ]
countryName                     = Country Name (2 letter code)
countryName_value               = CN

stateOrProvinceName             = State or Province Name (full name)
stateOrProvinceName_value       = Shanghai

localityName                    = Locality Name (eg, city)
localityName_value              = Minhang

organizationName                = Organization Name (eg, company)
organizationName_value          = SaiMo

organizationalUnitName          = Organizational Unit Name (eg, section)
organizationalUnitName_value    = Software Department

commonName                      = Common Name (eg, your name or your server\'s hostname)
commonName_value                = *.saimoyun.com


emailAddress                    = Email Address
emailAddress_value              = zhenggang.jiang@saiwangyun.com
""" > ~/ikube/tls/openssl.cnf
openssl req -newkey rsa:4096 -nodes -config ~/ikube/tls/openssl.cnf -days 3650 -x509 -out ~/ikube/tls/tls.crt -keyout ~/ikube/tls/tls.key
kubectl create -n kube-system secret tls ssl --cert ~/ikube/tls/tls.crt --key ~/ikube/tls/tls.key

