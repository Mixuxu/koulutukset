J�rjestelm� sis�lt�� email-notifikaation
batch-nimisess� kansiossa, joka ajetaan komentorivilt�
ja laitetaan croniin esim. kuten alla.

0 16 * * * /root/bin/laheta_email.pl >/dev/null 2>&1

Ohjelmiston on tehnyt Jukka Juslin