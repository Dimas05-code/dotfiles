#!/usr/bin/env bash

# Hentikan paksa semua proses Polybar yang sedang berjalan
killall -q polybar

# Tunggu sampai prosesnya benar-benar mati
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Luncurkan Polybar yang baru (diam-diam di latar belakang)
polybar cyberbar >/dev/null 2>&1 &
