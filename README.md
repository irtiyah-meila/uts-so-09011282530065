x# uts-so-09011282530065
# Tugas Besar UTS Sistem Operasi
## 1. Identitas
- **Nama:** Meila Irtiyah Dekha Putri
- **NIM:** 09011282530065
- **Kelas:** SKU3B

## 2. Deskripsi
Repositori ini berisi sekumpulan shell script otomatisasi Linux untuk mencari file teks praktikum berformat `.txt` (termasuk di dalam subdirektori), mengarsip dan mengompresnya ke dalam format `.tar.gz` dengan penamaan berbasis waktu (*timestamp*), serta mencatat aktivitas ke dalam file *log*. Dilengkapi juga dengan skrip perulangan latar belakang (*background loop*) dan manajemen alias.

## 3. Cara Menjalankan
- **Backup Manual:**
```bash
./script/backup.sh

## 4. Fitur Pengembangan
**Pencarian Otomatis Berdasarkan Ekstensi:** Skrip dirancang untuk mendeteksi dan memfilter file teks `.txt` secara rekursif hingga ke dalam subdirektori.
**Manajemen Log Aktivitas:** Setiap proses backup, perulangan, atau eksekusi perintah dicatat secara otomatis ke dalam file *log* untuk memudahkan audit dan pemantauan sistem.
**Interaksi Alias Kustom:** Mempermudah pemanggilan skrip utama dengan mendefinisikan alias khusus pada sistem shell.

## 5. Bukti Job Control
Pengujian pengelolaan proses latar belakang (*background processes*) menggunakan perintah manajemen job Linux:

**Menjalankan Proses di Latar Belakang (`&`):**
\`\`\`bash
 ./script/background_loop.sh &
\`\`\`
**Melihat Daftar Job Aktif(`jobs`):**
\`\`\`bash
jobs -l
\`\`\`
 *(Menampilkan daftar PID dari proses perulangan latar belakang yang sedang berjalan).*
**Mengembalikan Job ke Latar Depan (`fg`):**
\`\`\`bash
fg %1
\`\`\`
**Mengembalikan Job Secara Paksa (`kill`):**
\`\`\` bash
kill -9 <PID>
\`\`\`

## 6. Kendala dan Solusi
**Kendala 1:** Hak akses file (*permission*) skrip yang belum dapat dieksekusi secara langsung (`Permission denied`).
 **Solusi:** Memberikan izin eksekusi menggunakan perintah `chmod +x script/*.sh`.
**Kendala 2:** Proses latar belakang tetap berjalan dan terus menghasilkan output meskipun terminal tertutup.
 **Solusi:** Menggunakan perintah `nohup` atau  mengalihkan output ke `/dev/null`, serta memantau proses menggunakan `ps aux` sebelum dihentikan dengan `kill`.


