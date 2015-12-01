Järjestelmä sisältää email-notifikaation
batch-nimisessä kansiossa, joka ajetaan komentoriviltä
ja laitetaan croniin esim. kuten alla.

0 16 * * * /root/bin/laheta_email.pl >/dev/null 2>&1

Ohjelmiston on tehnyt Jukka Juslin