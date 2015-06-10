Mikubot
============

Ein Telegram-Bot auf Basis von [tg](https://github.com/vysheng/tg), der Plugins nutzt. Ein Fork von [yagops Telegram-Bot](https://github.com/yagop/telegram-bot).

Multimedia
----------
- Wenn ein User ein Bild (png, jpg, jpeg) sendet, wird es gedownloadet und gesendet.
- Wenn ein User eine Medien-Datei (gif, mp4, pdf, etc.) sendet, wird sie gedownloadet und gesendet.
- Wenn ein User ein Twitter-Link sendet, wird der Text und evtl. das Bild gesendet.
- Wenn ein User ein YouTube-Link sendet, wird der Titel, optional die Beschreibung, der Autor und die Aufrufeanzahl gesendet.

![http://i.imgur.com/0FGUvU0.png](http://i.imgur.com/0FGUvU0.png) ![http://i.imgur.com/zW7WWWt.png](http://i.imgur.com/zW7WWWt.png) ![http://i.imgur.com/zW7WWWt.png](http://i.imgur.com/kPK7paz.png)

Kommandos
------------
```
/stats -> Zeigt die Anzahl der Nachrichten der User
/date -> Zeigt das aktuelle Datum an
/gif -> Sendet ein GIF von Giphy
/plugins, /plugins enable [plugin], /plugins disable [plugin], /plugins reload, /reload -> Aktiviert, deaktiviert und lÃ¤dt Plugins
/addquote [Zitat], /quote -> Zitat speichern (/addquote) oder abrufen (/quote)
/set [Variablenname] [Daten] -> Setze Variable
/geschlecht [Name] -> Sendet Geschlecht
/xkcd [id] -> Sendet einen zufÃ¤lligen XKCD-Comic, wenn keine ID gegeben ist.
/wiki Suchwort -> Sendet einen Wikipedia-Artikel
/9gag -> Sendet ein zufÃ¤lliges Bild von 9GAG.com
/echo [Nachricht] -> Gibt die Nachricht aus
/translate [Text] (Ãœbersetze Text zu deutsch), /translate Zielsprache [Text], /translate Quellsprache,Zielsprache [Text] -> Ãœbersetze Text (Funktioniert zur Zeit nicht)
/google Stichwort -> Durchsucht Google
/wetter (Stadt) -> Wetter in dieser Stadt (Berlin ist Standard)
/version -> Zeigt die Version des Bots
/img [Thema] -> Sucht Bild mit Google-API und versendet es (SafeSearch aktiv)
/zeit [Land/Ort] -> Zeigt die lokale Zeit in einer Zeitzone an
/tw [Text] -> Sendet einen Tweet
/youtube [Suchbegriff] -> Sucht YouTube-Video und sendet es
/hilfe -> Listet alle Kommandos auf
/loc (Ort) -> Zeigt Informationen Ã¼ber einen Ort.
/get (Variable) -> Bekommt Variable, die mit !set gesetzt wurde
```
Es sind noch einige mehr dabei.

Installation
------------
```bash
# Gestet auf Ubuntu 14.04, fÃ¼r andere Distris, checke https://github.com/vysheng/tg#installation
$ sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev make unzip git redis-server libjansson-dev libpython-dev
```
```bash
# Nach den AbhÃ¤ngigkeiten kommt jetzt die Installation des Bots
$ cd $HOME
$ git clone https://github.com/Akamaru/Mikubot.git
$ cd Mikubot
$ ./launch.sh install
$ ./launch.sh # Fragt dich nach deiner Telefonnummer und dem Verifizierungscode
```

Mehr [`Plugins`](https://github.com/Akamaru/Mikubot/tree/master/plugins) aktivieren
-------------
Schau dir die Plugins-Liste mit `/plugins` an.

Aktiviere oder deaktiviere ein Plugin mit `/plugins enable [name-ohne-.lua]`.

Deaktiviere ein aktiviertes Plugin mit `/plugins disable [name-ohne-.lua]`.

Diese Kommandos benÃ¶tigen einen privilegierten User (Superuser). Superuser sind in der `data/config.lua` definiert (vom Bot generiert). Stoppe den bot und editiere die Konfigurationsdatei ggf.

## User fÃ¼r die Benutzung des /tw-Befehls freischalten
Erstelle einen Abschnitt in der config.lua:
```lua
can_send_tweet = {
    0,
    1,
    1337,
    585858
}
```

Als einen Daemon starten
------------
Wenn deine Distribution mit [upstart](http://upstart.ubuntu.com/) kommt, kannst du den Bot damit starten (empfohlen wird aber daemontools):
```bash
$ sed -i "s/yourusername/$(whoami)/g" etc/telegram.conf
$ sed -i "s_telegrambotpath_$(pwd)_g" etc/telegram.conf
$ sudo cp etc/telegram.conf /etc/init/
$ sudo start telegram # Zum Starten
$ sudo stop telegram # Zum Stoppen
```

/translate Plugin
------------
Es gibt 3 Arten, das Plugin zu nutzen:

Auf deutsch Ã¼bersetzen: /translate [Text]

Von deutsch in andere Sprache: /translate Zielsprache [Text]

Von beliebiger Sprache in beliebige Sprache: /translate Quellsprache,Zielsprache [Text]


Wobei Quellsprache und Zielsprache die LÃ¤nderkÃ¼rzel sein mÃ¼ssen (de, en, ru, it, fr...)

Kontaktiere mich
------------
Du kannst den originalen Autor (Yagop) [Ã¼ber Telegram](https://telegram.me/yago_perez) erreichen, aber wenn du einen Bugreport erstelle willst, so [tue dies](https://github.com/yagop/telegram-bot/issues) auf GitHub.

Wenn du stattdessen mich, den Autor des Forks, kontaktieren mÃ¶chtest, kannst du dies [Ã¼ber Telegram](https://telegram.me/Akamaru) tun.