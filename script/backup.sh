
#!/bin/bash
# Nama : Meila Irtiyah Dekha Putri
# NIm  : 09011282530065
# Tugas Besar UTS Sistem Operasi

#2.Variabel direktori dan file
SRC_DIR="$HOME/data_09011282530065"
DEST_DIR="$HOME/backup_09011282530065"
LOG_FILE="$DEST_DIR/backup.log"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
ARCHIVE_NAME="backup_09011282530065_${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="$DEST_DIR/$ARCHIVE_NAME"
LIST_FILE="/tmp/file_list_09011282530065.txt"

#3.Buat direktori tujuan jika belum ada
mkdir -p "$DEST_DIR"

#4.Pencarian file .txt (termasuk di subdirektori)
find "$SRC_DIR" -type f -name "*.txt" > "$LIST_FILE" 2>/dev/null

#Hitung jumlah file yang akan di-backup
FILE_COUNT=$(find "$SRC_DIR" -type f -name "*.txt" | wc -l)

#5.Pengarsipan dan kompresi menggunakan tar
#menggunakan opsi -T untuk membaca daftar dari file find
find "$SRC_DIR" -type f -name "*.txt" > "$LIST_FILE"
tar -czvf "$ARCHIVE_PATH" -T "$LIST_FILE" 2>/dev/null

#6.Verifikasi arsip tanpa mengekstrak
echo "Verifikasi isi arsip:"
tar -tzvf "$ARCHIVE_PATH"

#Ambil ukuran arsip untuk log
ARCHIVE_SIZE=$(du -h "$ARCHIVE_PATH" | awk '{print $1}')

#7.Pencatatan log  (Format: Tanggal Jam | Nama  Arsip | Ukuran)
CURRENT_TIME=$(date +%Y-%m-%d_%H:%M:%S)
echo "$CURRENT_TIME | $ARCHIVE_NAME | $ARCHIVE_SIZE" >> "$LOG_FILE"

#Bersihkan file sementara
rm -f "$LIST_FILE"

echo "Backup selesai!"

