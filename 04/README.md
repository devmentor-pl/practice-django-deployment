1. Zainstaluj Docker na VPS

2. Przed pierwszym pushem (jednorazowo na VPS): wykonaj w katalogu `/root` polecenie `git clone ADRES_REPOZYTORIUM practice-django-deployment`

3. Skopiuj `.env` na VPS do katalogu `/root/practice-django-deployment`
```env
DJANGO_SECRET_KEY=twoj_klucz
DEBUG=False
ALLOWED_HOSTS=localhost,127.0.0.1,TWOJE_IP
CSRF_TRUSTED_ORIGIN=http://TWOJE_IP:PORT
```

4. Skonfiguruj GitHub Secrets. W repozytorium GitHub przejdź do: 
`Settings → Secrets and variables → Actions` 
Dodaj wymagane sekrety:
`SSH_HOST` Adres serwera VPS
`SSH_USER` Użytkownik SSH
`SSH_PRIVATE_KEY` Klucz prywatny SSH
`SSH_PORT` Port SSH przypisany do VPS

5. Utwórz gałąź main. Otwórz terminal w katalogu projektu i wykonaj:
`git add .`
`git commit -m "Initial deployment"`
`git push origin main`

6. Deploy aplikacji Django na VPS uruchamiany jest automatycznie przez GitHub Actions po wysłaniu zmian do gałęzi main.
Po wykonaniu git push GitHub Actions automatycznie:
- Wykryje zmiany w gałęzi main
- Uruchomi workflow zapisany w deploy.yml
- Połączy się z VPS przez SSH
- Wykona git pull, aktualizując kod aplikacji na serwerze
- Zbuduje i uruchomi kontenery poleceniem docker compose up -d --build
- Wykona migracje bazy danych przez python manage.py migrate
- Zbierze pliki statyczne przez python manage.py collectstatic --noinput

7. Aby sprawdzić wyniku wdrożenia przejdź do następującej zakładki na GitHubie:
`Actions → Deploy Django App`
- Otwórz najnowsze uruchomienie workflow i sprawdź jego logi.
- Zielony znacznik – workflow zakończył się pomyślnie.
- Czerwony znacznik – wystąpił błąd, którego szczegóły znajdują się w logach
- Następnie sprawdź działanie aplikacji w przeglądarce, korzystając z publicznego adresu i portu przydzielonego na VPS
- Możesz również zalogować się na serwer i sprawdzić stan kontenerów poleceniem `docker compose ps`
- Po poprawnym wykonaniu pierwszego deployu kolejne zmiany wysłane do gałęzi main będą automatycznie wdrażane na VPS, bez konieczności ręcznego logowania się na serwer