# secretverify

**Interactive Secret / Token Validator** — companion tool untuk [secrethunter](https://github.com/trendmicro/secrethunter). Jalankan sekali, pilih layanan, tempel API key/token, dan script akan mengecek validitasnya secara langsung ke endpoint resmi (atau validasi format jika butuh konteks tambahan).

Mendukung **157 layanan** — AWS, Google, GitHub, GitLab, Stripe, Telegram, Twilio, Discord, Slack, dan lainnya — dengan menu interaktif, pencarian layanan (`/kata`), laporan valid/invalid, dan auto-jump.

## Fitur

- ✅ **157 layanan** dalam satu tool
- 🔎 **Pencarian** ketik `/stripe`, `/github`, `/aws`, dst. untuk langsung menemukan nomor layanan
- 🚀 **Auto-jump** setelah pencarian: langsung tanya "Langsung cek #17?"
- 🧪 **Verifikasi nyata** — cek HTTP ke endpoint resmi dengan key/token Anda
- 🎯 **Format-check** untuk layanan yang butuh context tambahan (client_id, tenant, dsb.)
- 📋 **Session log** — simpan hasil validasi ke file (tombol `S`)
- 🧹 **Amankan** — temp file pakai `mktemp`, auto-cleanup saat keluar
- ⏱️ **CLI one-shot**: `secretverify 17` langsung validasi Stripe sekali jalan

## Instalasi

### Prasyarat

- `bash` (Linux/macOS, Git Bash di Windows, atau WSL)
- `curl` — cek dengan `curl --version`

### Linux / macOS / WSL / Git Bash — install otomatis

```bash
curl -fsSL https://raw.githubusercontent.com/alb-soul/Secretverify/main/install.sh | bash
```

atau manual — salin script ke folder yang ada di `PATH`:

```bash
# 1. download script
curl -fsSL https://raw.githubusercontent.com/alb-soul/Secretverify/main/secretverify -o secretverify

# 2. beri izin eksekusi
chmod +x secretverify

# 3. pindahkan ke folder PATH (contoh: /usr/local/bin)
sudo mv secretverify /usr/local/bin/
# atau tanpa sudo:
# install -m 755 secretverify ~/.local/bin/

# 4. cek
hash -r && secretverify
```

### Windows (Command Prompt / PowerShell) — install otomatis

```powershell
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/alb-soul/Secretverify/main/install.bat -OutFile $env:TEMP\install-sv.bat; & $env:TEMP\install-sv.bat"
```

atau manual:

1. Download file `secretverify` ke folder seperti `C:\secretverify\`
2. Tambahkan folder tersebut ke `PATH` Anda:
   - Tekan `Win + R`, ketik `sysdm.cpl`, Enter
   - Tab **Advanced** → **Environment Variables**
   - Di **User variables**, pilih `Path` → **Edit** → **New**
   - Tambahkan `C:\secretverify` → OK
3. Buka Git Bash / WSL, lalu jalankan `secretverify`

### Alternatif: jalankan tanpa install

```bash
# langsung dari repo (clone)
git clone https://github.com/alb-soul/Secretverify.git
cd Secretverify
./secretverify
```

## Penggunaan

```bash
secretverify                # menu interaktif
secretverify 17             # langsung validasi Stripe (one-shot)
```

### Di dalam menu

| Input | Aksi |
|-------|------|
| `1-157` | Pilih layanan |
| `/kata` | Cari layanan (mis. `/stripe`, `/aws`) |
| `C` | Bersihkan layar |
| `S` | Simpan log sesi ke file |
| `Q` | Keluar |

Setelah memilih layanan, tempel key/token Anda lalu Enter. Hasil akan ditampilkan sebagai `[✓ VALID]`, `[✗ INVALID]`, atau `[!]` untuk keterangan tambahan.

## Layanan (157)

| No | Layanan | No | Layanan | No | Layanan |
|----|---------|----|---------|----|---------|
| 1 | AWS Access Key | 2 | Google API Key | 3 | Google OAuth |
| 4 | Cloudflare | 5 | DigitalOcean | 6 | GitHub |
| 7 | GitLab | 8 | npm | 9 | Heroku |
| ... | (lihat menu lengkap di dalam tool) | | | | |

Ketik `/` di menu untuk mencari daftar lengkap, mis. `/github`, `/telegram`, `/stripe`.

## Catatan Keamanan

- Tool ini hanya **verifikasi** — beberapa layanan yang mencoba validasi via endpoint berbayar (mis. AI/LLM) akan **membebankan biaya ke akun pemilik key**. Gunakan dengan bijak.
- Jangan pernah membagikan key/token yang Anda tempel.
- Log sesi disimpan lokal atas permintaan Anda (`S`) — pastikan tidak mengandung key yang bocor.

## Lisensi

MIT
