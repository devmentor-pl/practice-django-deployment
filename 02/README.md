INSTRUKCJA URUCHOMIENIA

1. Utwórz plik `.env` ze zmiennymi środowiskowymi na podstawie pliku `.env.example`

2. Utwórz obraz i kontener poleceniem `docker compose up --build`

3. Wejdź w przeglądarce na adres `http://127.0.0.1:80/` lub `http://localhost/` i sprawdź czy pojawia się ekran startowy aplikacji Django

4. Sprawdź, czy port 8000 jest dostępny pod adresem `http://127.0.0.1:8000/` - ma nie być dostępny