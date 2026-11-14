Automatyczny backup bazy danych (Cron) 
1. Nadaj uprawnienia dla skryptu poleceniem `chmod +x backup.sh`
2. Otwórz tablicę zadań cron `crontab -e` i dodaj na samym dole 
`0 2 * * * /sciezka/do/projektu/backup.sh`
3. Zweryfikuj poprawność pliku poleceniem `crontab -l`
4. Wyjaśnienie harmonogramu wykonania:
* `0` – minuta (`00`)
* `2` – godzina (`02`)
* `*` – każdy dzień miesiąca
* `*` – każdy miesiąc
* `*` – każdy dzień tygodnia
* `/sciezka/do/projektu/backup.sh` – bezwzględna ścieżka do skryptu na hoście