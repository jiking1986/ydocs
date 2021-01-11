/usr/bin/security dump-trust-settings -d

sudo /usr/bin/security add-trusted-cert -d -r trustRoot -p basic -p ssl -k /Library/Keychains/System.keychain ...ca.crt