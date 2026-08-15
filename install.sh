#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────
#  secretverify installer — Linux / macOS / WSL / Git Bash
#  Pasang ke folder PATH agar bisa dipanggil dari mana saja.
# ─────────────────────────────────────────────────────────────
set -euo pipefail

REPO="alb-soul/Secretverify"
BRANCH="main"
URL="https://raw.githubusercontent.com/${REPO}/${BRANCH}/secretverify"

info()  { printf '\033[1;36m[i]\033[0m %s\n' "$*"; }
ok()    { printf '\033[1;32m[✓]\033[0m %s\n' "$*"; }
fail()  { printf '\033[1;31m[✗]\033[0m %s\n' "$*"; exit 1; }

# 1. Tentukan folder target
if [[ -w /usr/local/bin ]]; then
    DEST="/usr/local/bin"
elif [[ -w "$HOME/.local/bin" ]]; then
    DEST="$HOME/.local/bin"
elif [[ -w /usr/bin ]]; then
    DEST="/usr/bin"
else
    DEST="$HOME/.local/bin"
fi
mkdir -p "$DEST"

# 2. Download script
info "Downloading secretverify dari ${URL}"
tmp="$(mktemp)"
if ! curl -fsSL "$URL" -o "$tmp"; then
    fail "Gagal download. Cek koneksi internet."
fi

# 3. Pasang
install -m 755 "$tmp" "$DEST/secretverify"
rm -f "$tmp"

# 4. Pastikan PATH
case ":$PATH:" in
    *":$DEST:"*) : ;;
    *) info "Tambahkan '$DEST' ke PATH agar bisa dipanggil dari mana saja." ;;
esac

ok "secretverify terpasang di $DEST/secretverify"
info "Jalankan:  secretverify"
