# About

You need to create config.sh so it could work correctly. Example:
```sh
BASEBRAINY="$HOME/Documents/BaseBrainy/"
BASEBRAINYREMOTE="remote:BaseBrainy/"

BASHSCRIPTS="$HOME/Documents/repos/bash_scripts/"
BASHSCRIPTSREMOTE="remote:bash_scripts/"

LOGSEQ="$HOME/Documents/LogseqVault/"
LOGSEQREMOTE="remote:LogseqVault/"

CLIENT_ID=""
CLIENT_SECRET=""
```

Scripts dont have shebang cause I'm using NixOS and.. usual shebangs don't work here.

# Other

Короче нужно данные про пути перенести куда-то в базу данных или типо того. Вот пример: 

| id  | connection name | local dir path           | remote path         |
| --- | --------------- | ------------------------ | ------------------- |
| 1   | BaseBrainy      | ~/Documents/BaseBrainy/  | remote:BaseBrainy/  |
| 2   | LogseqVault     | ~/Documents/LogseqVault/ | remote:LogseqVault/ |

Можно попробовать [MySQL](https://en.wikipedia.org/wiki/MySQL) для этого юзануть. Не, походу лучше SQLite.

Зачем это делать? Чтоб хранить все данные в одном месте, и чтоб легко можно было создавать новые приколы которые нужно синхронизировать с гугл диском (соедененния или ремоутсы, хз как их лучше называть), и менять существующие при этом не лазая по скриптам лишний раз. Типо по сути они и так сейчас все находятся в одном месте, в config.sh. Но там никакой структуры нету, всё написанно чисто в виде переменных сверху вниз, а хотелось бы их куда-то загнать в словарь, или в туже базу данных, чтобы эти данные были как-то более организованны.
