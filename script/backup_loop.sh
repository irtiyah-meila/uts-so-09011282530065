#!/bin/bash
# Nama : Meila Irtiyah Dekha Putri
# Nim  : 09011282530065
# Tugas Besar UTS Sistem Operasi

#Jeda waktu antar backup (dalam detik, misal 60 detik)
INTERVAL=60

echo "Memulai backup loop. Skrip akan berjalan setiap $INTERVAL detik."
echo "Tekan Ctrl+C jika di foreground, atau gunakan kill jika di background."

while true; do
#memanggil skrip backup utama
./script/backup.sh

echo "Menunggu selama $INTERVAL detik sebelum backup berikutnya..."
sleep "$INTERVAL"
done
