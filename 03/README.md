INSTRUKCJA WYGENEROWANIA CERTYFIKATU SELF_SIGNED

1. Utwórz katalog `certs` i przejdź do niego w Git Bash 

2. Wygeneruj certyfikat oraz klucz prywatny za pomocą openssl wpisując w Git Bash polecenie: 

```
MSYS_NO_PATHCONV=1 openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout privkey.pem \
  -out fullchain.pem \
  -subj "/CN=localhost" \
  -addext "subjectAltName=DNS:localhost,IP:127.0.0.1"
```